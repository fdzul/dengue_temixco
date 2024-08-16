
load("/Users/fdzul/Library/CloudStorage/OneDrive-Personal/proyects/geocoding_mex/2024/8.RData/denmex_2024.RData")

z <- z |>
    dplyr::mutate(x = long,
                  y = lat) |>
    sf::st_as_sf(coords = c("long", "lat"),
                 crs = 4326)

mun <- rgeomex::AGEM_inegi19_mx |>
    dplyr::filter(CVE_ENT == 17)

z <- z[mun,] |>
    sf::st_drop_geometry()


leaflet::leaflet() |>
    leaflet::addProviderTiles(leaflet::providers$OpenStreetMap) |>
    leaflet.extras::addHeatmap(data = z,
                               lng = ~x,
                               lat = ~y,
                               radius = 20)



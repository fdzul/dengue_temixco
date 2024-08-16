

load("/Users/fdzul/Library/CloudStorage/OneDrive-Personal/proyects/geocoding_mex/2024/8.RData/denmex_2024.RData")

z <- z |>
    sf::st_as_sf(coords = c("long", "lat"),
                 crs = 4326) |>
    dplyr::mutate(ESTATUS_CASO = ifelse(ESTATUS_CASO == 1,
                                        "Probable",
                                        "Confirmado"))

edo <- rgeomex::AGEM_inegi19_mx |>
    dplyr::filter(CVE_ENT == 17) |>
    dplyr::filter(NOMGEO == "Temixco")

z <- z[edo,]

mapview::mapview(z) +
    leaflet.extras::addHeatmap()



confirmados <- z |>
    dplyr::filter(ESTATUS_CASO == "Confirmado")
probables <- z |>
    dplyr::filter(ESTATUS_CASO == "Probable")

serotype_1 <- z |>
    dplyr::filter(ESTATUS_CASO == "Confirmado") |>
    dplyr::filter(DENGUE_SER_TRIPLEX == 1)
serotype_2 <- z |>
    dplyr::filter(ESTATUS_CASO == "Confirmado") |>
    dplyr::filter(DENGUE_SER_TRIPLEX == 2)
serotype_3 <- z |>
    dplyr::filter(ESTATUS_CASO == "Confirmado") |>
    dplyr::filter(DENGUE_SER_TRIPLEX == 3)
serotype_4 <- z |>
    dplyr::filter(ESTATUS_CASO == "Confirmado") |>
    dplyr::filter(DENGUE_SER_TRIPLEX == 4)

##############
mapview::mapview(probables,
                 col.regions = "#898F9C",
                 color = "white",
                 layer.name = "Probables") +
    mapview::mapview(confirmados,
                     col.regions = "#4267B2",
                     color = "white",
                     layer.name = "Positivos") +
    mapview::mapview(serotype_1,
                     col.regions = "#36C5F0",
                     color = "white",
                     layer.name = "DENV-1") +
    mapview::mapview(serotype_3,
                     col.regions = "#E01E5A",
                     color = "white",
                     layer.name = "DENV-3") 


# step 1. load teh dengue dataset ####
load("~/Library/CloudStorage/OneDrive-Personal/automatic_read_sinave/8.RData/den/den2008_2024.RData")


# Step 2. aggregate the dengue dataset ####
x1 <- den2008_2015 |>
    dplyr::filter(VEC_EST == 2) |>
    #dplyr::filter(CVE_EDO == 17) |>
    dplyr::group_by(DES_EDO.x, DES_MPO.x, ANO) |>
    dplyr::summarise(n = dplyr::n(), .groups = "drop") |>
    dplyr::rename(mpo = DES_MPO.x, 
                  edo = DES_EDO.x,
                  year = ANO) 
# Step 2. aggregate the dengue dataset ####
y1 <- den2016_2024 |>
    dplyr::filter(ESTATUS_CASO == 2) |>
    #dplyr::filter(CVE_EDO_RES == 17) |>
    dplyr::group_by(DES_EDO_RES,DES_MPO_RES, ANO) |>
    dplyr::summarise(n = dplyr::n(), .groups = "drop") |>
    dplyr::rename(mpo = DES_MPO_RES ,
                  edo = DES_EDO_RES,
                   year = ANO) 

# Step 3. aggregated dataset ####
xy <- dplyr::bind_rows(x, y)


# mexico y morelos ####
ggplot2::ggplot() +
    ggplot2::geom_col(data = xy,
                       ggplot2::aes(x = year,
                                    y = n),
                      fill = "#04225CFF")  +
    ggplot2::geom_col(data = xy |> 
                          dplyr::filter(edo == "MORELOS"),
                      ggplot2::aes(x = year,
                                   y = n),
                      fill = "#DC3B34FF") +
    ggplot2::scale_x_continuous(breaks = seq(from = 2008,
                                             to = 2024,
                                             by = 1)) +
    ggplot2::ylab("Casos de Dengue") +
    ggplot2::xlab("Años") 

# morelos & temixco ####
ggplot2::ggplot() +
    ggplot2::geom_col(data = xy |> dplyr::filter(edo == "MORELOS"),
                      ggplot2::aes(x = year,
                                   y = n),
                      fill = "#04225CFF") +
    ggplot2::geom_col(data = xy |> 
                          dplyr::filter(edo == "MORELOS") |>
                          dplyr::filter(mpo == "TEMIXCO"),
                      ggplot2::aes(x = year,
                                   y = n),
                      fill = "#DC3B34FF") +
    ggplot2::scale_x_continuous(breaks = seq(from = 2008,
                                             to = 2024,
                                             by = 1)) +
    ggplot2::ylab("Casos de Dengue") +
    ggplot2::xlab("Años") 





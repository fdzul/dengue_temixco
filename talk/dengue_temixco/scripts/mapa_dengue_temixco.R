


# Step 1. load the dataset ####
path_sinave <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/DGE/denv/2024/DENGUE2_.txt"

x <- denhotspots::read_dengue_dataset(path = path_sinave,
                                      spatial_resolution = "country",
                                      status_caso = c(2))

# Step 2. agragated dataset ####

a <- densnv::cases_by_agem(path_vbd = "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/DGE/denv/2023",
                           vbd = "DENGUE",
                           status_case = 2,
                           country = FALSE,
                           cve_edo = 17)
b <- densnv::cases_by_agem(path_vbd = "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/DGE/denv/2024",
                           vbd = "DENGUE",
                           status_case = 2,
                           country = FALSE,
                           cve_edo = 17)
mapview::mapview(a,
                 zcol = "n",
                 layer.name = "Casos 2023")

mapview::mapview(b,
                 zcol = "n",
                 layer.name = "Casos 2024")


########
# Step 1. load th dataset
load("/Users/fdzul/Library/CloudStorage/OneDrive-Personal/proyects/geocoding_mex/2024/8.RData/denmex_2024.RData")
densnv::mp_heatmap(locality = "Temixco",
                   cve_edo = "17",
                   geocoded_datasets = z,
                   zoom = 13,
                   status_caso = c(2),
                   week = c(1:33),
                   alpha = 0.2,
                   static = TRUE,
                   map_type = "satellite")





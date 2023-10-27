# Title     : InstallPackages.R
# Objective : Installs Packages
# Created by: greyhypotheses
# Created on: 27/10/2023


#' Install packages
#'
InstallPackages <- function (){

  packages <- c('IRdisplay', 'data.table', 'tidyverse', 'doParallel', 'moments', 'rmarkdown',
                'latex2exp', 'mapview', 'roxygen2', 'equatiomatic', 'rstatix', 'matrixStats', 'patchwork',
                'geoR', 'PrevMap', 'kableExtra', 'bookdown', 'lme4', 'nlme', 'DescTools',
                'sf', 'raster', 'tmap', 'terra', 'spData', 'tidygeocoder', 'rnaturalearth', 'geodata',
                'httr', 'leaflet', 'splancs', 'paletteer', 'ggthemes', 'ggcorrplot')

  # Install
  .install <- function(x){
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      if (x == 'rmarkdown') {tinytex::install_tinytex()}
    }
  }
  lapply(packages, .install)

}

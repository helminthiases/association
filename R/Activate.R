# Title     : Activate.R
# Objective : Activate
# Created by: greyhypotheses
# Created on: 23/07/2022


#' Activate Libraries
#'
Activate <- function () {

  packages <- c('IRdisplay', 'data.table', 'tidyverse', 'doParallel', 'moments', 'rmarkdown',
                'latex2exp', 'mapview', 'roxygen2', 'equatiomatic', 'rstatix', 'matrixStats', 'patchwork',
                'geoR', 'PrevMap', 'kableExtra', 'bookdown', 'lme4', 'nlme', 'DescTools',
                'sf', 'raster', 'tmap', 'terra', 'spData', 'tidygeocoder', 'rnaturalearth', 'geodata',
                'httr', 'leaflet', 'splancs', 'paletteer', 'ggthemes', 'ggcorrplot')

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE, lib.loc = 'J:/Programs/R/R-4.1.3/library')
    if (x == 'rmarkdown') {library(tinytex, lib.loc = 'J:/Programs/R/R-4.1.3/library')}
  }
  lapply(packages[!(packages %in% c('tidyverse', 'healthcareai', 'equatiomatic', 'data.table',
                                    'terra', 'raster', 'tidygeocoder', 'rnaturalearth', 'leaflet', 'splancs'))], .activate)

  # Special Case
  if ('tidyverse' %in% packages) {
    lapply(X = c('magrittr', 'dplyr', 'tibble', 'ggplot2', 'stringr', 'lubridate'), .activate)
  }

  # Active libraries
  sessionInfo()

}
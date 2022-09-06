# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 14/07/2022


source(file = 'R/correlation/Steps.R')


# data sources
files <- list.files(path = file.path(getwd(), 'data', 'missing', 'disaggregates'),
                    full.names = TRUE)


# in parallel
cores <- parallel::detectCores() - 2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
X <- parallel::clusterMap(clusters, fun = Steps, files, USE.NAMES = FALSE)
parallel::stopCluster(clusters)
rm(clusters, cores)
correlations <- dplyr::bind_rows(X)

alternative <- tidyr::pivot_longer(data = correlations,
                                   cols = c(year, longitude, latitude, hk_prevalence, asc_prevalence, tt_prevalence, coordinates),
                                   names_to = 'reference', values_to = 'cramer')


# storage
storage <- file.path(getwd(), 'warehouse', 'missing', 'correlation')
if (file.exists(storage)) {
  base::unlink(x = storage, recursive = TRUE)
}
dir.create(path = storage, recursive = TRUE)


# write
utils::write.table(x = correlations,
                   file = file.path(storage, 'wide.csv'),
                   append = FALSE,
                   sep = ',',
                   na = '',
                   row.names = FALSE,
                   col.names = TRUE,
                   fileEncoding = 'UTF-8')

utils::write.table(x = alternative,
                   file = file.path(storage, 'long.csv'),
                   append = FALSE,
                   sep = ',',
                   na = '',
                   row.names = FALSE,
                   col.names = TRUE,
                   fileEncoding = 'UTF-8')

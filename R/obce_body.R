#' Municipalities / communes (obce) as centerpoints
#'
#' Function returning data frame of LAU2 administrative units for the Czech Republic as \code{sf} points. It takes no parameters.
#'
#'  Due to package size constraints the data are stored externally (and a working internet connection is required to use the package). Downloaded size is 270 KB.
#'
#' @param method Method argument for `download.file()`. The default (i.e. "curl") should be appropriate in most situations.
#'
#' @format \code{sf} data frame with 6.258 rows of 14 variables + geometry
#'
#' \describe{
#'   \item{KOD_OBEC}{Code of the level I commune (obec).}
#'   \item{NAZ_OBEC}{Name of the level I commune (obec).}
#'   \item{KOD_ZUJ}{Code of the basic administrative unit (ICZUJ).}
#'   \item{NAZ_ZUJ}{Name of the basic administrative unit (ICZUJ).}
#'   \item{KOD_POU}{Code of the level II commune (obec s poverenym uradem).}
#'   \item{NAZ_POU}{Name of the level II commune (obec s poverenym uradem)).}
#'   \item{KOD_ORP}{Code of the level III commune (obec s rozsirenou pusobnosti).}
#'   \item{NAZ_ORP}{Name of the level III commune (obec s rozsirenou pusobnosti).}
#'   \item{KOD_OKRES}{Code of the district (okres).}
#'   \item{KOD_LAU1}{Code of the LAU1 administrative unit (okres).}
#'   \item{NAZ_LAU1}{Name of the LAU1 administrative unit (okres).}
#'   \item{KOD_KRAJ}{Code of the region (kraj).}
#'   \item{KOD_CZNUTS3}{Code of the NUTS3 unit (kraj)}
#'   \item{NAZ_CZNUTS3}{Name of the NUTS3 unit (kraj)}
#'   }
#'
#'
#' @source \url{https://www.arcdata.cz/produkty/geograficka-data/arccr-500}
#'
#'
#' @export

obce_body <- function(method = "curl") {

  remote_path <- 'http://rczechia.jla-data.net/'

  file <- 'ObceB.rds'

  remote_file <- paste0(remote_path, file)
  local_file <- file.path(tempdir(), file)

  if (file.exists(local_file)) {

    message('RCzechia: using temporary local dataset.')

  } else {

    if (http_error(remote_file)) {

      stop('No internet connection or data source broken.')

    } else {

      message('RCzechia: downloading remote dataset.')
      download.file(url = remote_file, destfile = local_file, method = method, quiet = T)
    }
  }

  local_df <- readRDS(local_file)
  local_df
}

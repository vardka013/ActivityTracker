#####################################################################################################
#                                                                                                   #
#                                                                                                   #
#                                   STRAVA DOWNLOAD AND ADD TO GOOGLE SHEETS                        #
#                                                                                                   #
#                                                                                                   #
#####################################################################################################
if (!requireNamespace("rstudioapi", quietly = TRUE)) install.packages("rstudioapi")

sys_path <- dirname(rstudioapi::getSourceEditorContext()$path)

#---------------------------------------------------------------------------------------------------#

#####################################################
#   PARAMETER                                       #
#####################################################

flg_load_token  <- 1

appname         <- "ActivityTracker"
redirect_uri    <- "http://localhost"

authorize_url   <- "https://www.strava.com/oauth/authorize"
token_url       <- "https://www.strava.com/oauth/token"

# GOOGLE SHEETS
sheet_name      <- "strava_import"

#####################################################
#   LOAD PACKAGES & FUNCTIONS                       #
#####################################################
source(file.path(sys_path, "FUNCTIONS/FUN_install_or_update.R"))
source(file.path(sys_path, "FUNCTIONS/FUN_calculate_minutes_per_km_gs.R"))
fun_install_or_update("httr"); library(httr)
fun_install_or_update("jsonlite"); library(jsonlite) 
fun_install_or_update("googlesheets4"); library(googlesheets4)
fun_install_or_update("lubridate"); library(lubridate)

#####################################################
#  RUN CODE                                         #
#####################################################

source(file.path(sys_path, "SCRIPTS/RUN_IMPORT_CLIENT_INFO.R"))

if(flg_load_token == 1) source(file.path(sys_path, "SCRIPTS/RUN_GET_STRAVA_TOKEN.R"))

source(file.path(sys_path, "SCRIPTS/RUN_GET_STRAVA_DATA.R"))

source(file.path(sys_path, "SCRIPTS/RUN_EXPORT_TO_GOOGLE_SHEETS.R"))

#####################################################
#  END OF CODE                                      #
#####################################################
print("ACTIVITY TRACKER COMPLETE")

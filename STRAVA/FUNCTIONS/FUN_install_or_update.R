# Function to install or update a package if it doesn't exist or needs updating
fun_install_or_update <- function(package) {
  if (!requireNamespace(package, quietly = TRUE)) {
    install.packages(package)
  } else {
    # Check if the installed version is the latest
    installed_version <- packageVersion(package)
    available_version <- available.packages()[package, "Version"]
    
    if (!is.na(available_version) && available_version > installed_version) {
      install.packages(package)
    }
  }
}



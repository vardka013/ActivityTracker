# Read in the CSV file
config_data <- read.csv(file.path(sys_path, "CONFIG/CONFIG_STRAVA.csv"),fill = TRUE)

# Dynamically create variables from the dataframe
for (i in 1:nrow(config_data)) {
    # Assign the variable name and value
    assign(as.character(config_data$variable[i]), as.character(config_data$value[i]))
}
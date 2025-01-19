# Function to calculate minutes per km
fun_calculate_minutes_per_km_gs <- function(elapsed_time, distance) {
    if (distance == 0) {
        return(NA)  # Avoid division by zero if distance is 0
    }
    pace_in_minutes_per_km <- (elapsed_time / 60) / (distance / 1000)  # Elapsed time in minutes per kilometer
    # Convert minutes per kilometer to Google Sheets time format
    return(pace_in_minutes_per_km / (24))  # Minutes per km as fraction of a day
}
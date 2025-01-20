# Strava API URL for club activities
url <- paste0("https://www.strava.com/api/v3/clubs/", club_id, "/activities")

strava_page <- 1
check_page_full <- 1
activities_output <- NULL

while(check_page_full == 1){
    print(paste("run strava activity page: ",strava_page))
    # Fetch activities
    param <- list(
        per_page = 200,  # Number of activities per page (max 200)
        page = strava_page       
    )
  
    response <- GET(url, query = param, add_headers(Authorization = paste("Bearer", access_token)))
    
    # Check for a successful response
    if (http_status(response)$category == "Success") {
        # Parse JSON response
        activities <- fromJSON(content(response, as = "text"), flatten = TRUE)
        
        #create table from API query
        if(!is.null(nrow(activities))) {
            
            date_string <- sub("^([0-9]{4} [0-9]{2} [0-9]{2}).*", "\\1", activities$name)
            date_value <- as.Date(date_string, format = "%Y %m %d")
            
            # Create a data frame with the desired fields
            activities_df <- data.frame(
                Laufer              = paste(activities$athlete.firstname, activities$athlete.lastname),
                DATUM               = date_value,
                Distanz             = round(activities$distance / 1000, 2),
                Geschwindigkeit     = round(mapply(fun_calculate_minutes_per_km_gs, activities$moving_time, activities$distance),7) ,  
                Akivzeit            = round(activities$moving_time / 86433,7), # ALTERNATIVE TIME TRACKER: FULL TIME OF ACTIVITY
                Hoehenmeter         = activities$total_elevation_gain, 
                ActivityName        = activities$name,
                Kommentar           = NA,
                TYPE                = activities$type,
                ID                  = rev(seq_len(nrow(activities))) + strava_page * 1000,
                Gesamtzeit          = round(activities$elapsed_time / 86433,7) # ALTERNATIVE TIME TRACKER: FULL TIME OF ACTIVITY
            )
            
            filter_id <-  subset(activities_df, Laufer == "Christoph  T." & Distanz == 4.40 & Geschwindigkeit == 0.2389520 & Gesamtzeit == 0.0175165)$ID
            
            activities_output <- rbind(activities_output,activities_df[activities_df$ID > filter_id,])
        }
        
        # Check if page max (200) is reached and thus more activities migth be on the next page
        if(nrow(activities_df) == 200) check_page_full <- 1 else check_page_full <- 0
        strava_page <- strava_page + 1

    } else {
        stop("Strava access didn't work. Error: ", content(response, as = "text"))
    }
}

# View the resulting data frame
print(activities_output)
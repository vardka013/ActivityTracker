
# Google Sheets authentifizieren und bestehende Daten abrufen
gs4_auth(NA)

# Get google sheets data
existing_data <- read_sheet(ss = sheet_url, sheet = sheet_name)
existing_data <- existing_data %>% select(-ID)  

# combine google sheets data with strava data (remove duplicates)
combined_data <- rbind(activities_output,existing_data)
cleaned_data <- combined_data %>% distinct(Laufer, DATUM, Distanz, Geschwindigkeit, Akivzeit, Hoehenmeter, ActivityName, Kommentar, TYPE, Gesamtzeit, .keep_all = TRUE)
cleaned_data$ID <- nrow(cleaned_data):1

# export to google sheets
sheet_write(cleaned_data, ss = sheet_url, sheet = sheet_name)

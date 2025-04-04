#1: March 2025: Conny requested override to 11 km
fiter1 <- cleaned_data$Laufer == 'Conny N.' & cleaned_data$Distanz == 3.68 & cleaned_data$Geschwindigkeit ==  0.2320533 & cleaned_data$Hoehenmeter == 11
punish_factor                       <- 1.05
scaling1                            <- (11 / 3.68) * punish_factor
cleaned_data[fiter1,]$Distanz           <- 11
cleaned_data[fiter1,]$Akivzeit          <- cleaned_data[fiter1,]$Akivzeit * scaling1
cleaned_data[fiter1,]$Gesamtzeit        <- cleaned_data[fiter1,]$Gesamtzeit * scaling1
cleaned_data[fiter1,]$Geschwindigkeit   <- (cleaned_data[fiter1,]$Distanz / 1000) / cleaned_data[fiter1,]$Akivzeit
cleaned_data[fiter1,]$ActivityName      <- paste0('OR: ', cleaned_data[fiter1,]$ActivityName )

fun_calculate_minutes_per_km_gs(cleaned_data[fiter1,]$Distanz,cleaned_data[fiter1,]$Akivzeit )

cleaned_data <- cleaned_data %>% distinct(Laufer, DATUM, Distanz, Geschwindigkeit, Akivzeit, Hoehenmeter, ActivityName, Kommentar, TYPE, Gesamtzeit, .keep_all = TRUE)

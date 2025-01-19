# Export to Google Sheets
gs4_auth(NA)  # Authenticate Google account
sheet_write(activities_output, ss = sheet_url, sheet = sheet_name)
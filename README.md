# ActicityTracker

Welcome to the ActicityTracker repository! This tool provides powerful features to work with activity data from APIs like Strava and Fitbit. Below, you'll find an overview of its core functionalities and how to use them effectively.

---
## Features

1. **API Integration**:
   - Seamlessly connect to APIs like Strava and Fitbit to fetch activity data.
   - Support for club-wide activity data retrieval in Strava.

2. **Data Processing**:
   - Extract key metrics such as distance, elapsed time, speed, and elevation.
   - Transform times into formats compatible with Google Sheets (e.g., `HH:MM:SS` or `MM:SS`).

3. **Custom Calculations**:
   - Calculate pace (minutes per kilometer) for activities.
   - Add custom fields like row numbers and reversed row numbers.

4. **Export Options**:
   - Export processed activity data to CSV or directly integrate with external tools like Google Sheets.

---

## Getting Started

### Installation

INSTRUCTIONS TO "INSTALL" (only once):	LINKS:
1) download and install R	https://cran.r-project.org/bin/windows/base/
2) optional: download and install RStudio (IDE)	https://posit.co/download/rstudio-desktop/
3) download Repo from github	https://github.com/vardka013/ActivityTracker
4) create CONFIG_STRAVA.csv in STRAVA\CONFIG	containing, e.g.
sheet_url,https://docs.google.com/spreadsheets/d/18yx-J47ZIJWb0n6h9BmqdQSNzs3hKEf6d3qRxsa93EQ/edit?pli=1&gid=0#gid=0
club_id,herbert
client_id,1234578
client_secret,948cfefca71e2af3111e52dccb29e83fcd4d7b32

auth_url <- modify_url(
    authorize_url,
    query = list(
        client_id = client_id,
        response_type = "code",
        redirect_uri = redirect_uri,
        approval_prompt = "force",
        scope = "read,activity:read_all"
    )
)
browseURL(auth_url)

# Manually Paste the Authorization Code
cat("Paste the authorization code from the browser: ")
authorization_code <- readline()

response <- POST(
    token_url,
    body = list(
        client_id = client_id,
        client_secret = client_secret,
        code = authorization_code,
        grant_type = "authorization_code"
    ),
    encode = "form"
)

# Parse the response
if (status_code(response) == 200) {
    token_data <- content(response, "parsed")
    access_token <- token_data$access_token
    print(paste("Access Token:", access_token))
} else {
    print("Error exchanging authorization code for access token.")
}

#!/bin/bash

# Prompt the user for their API token
while [ -z "$token" ]; do
    read -p "Please enter your API token: " token < /dev/tty
done

# Loop through task IDs from 1 to 250
for i in {1..250}
do
    # Construct the Authorization header as per your Python format
    api_headers="Authorization: $token"

    # Make the POST request with the token in the Authorization header and capture the HTTP code separately
    http_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST "https://api.catshouse.club/tasks/$i/complete" \
    -H "$api_headers" \
    -H "Content-Type: application/json")

    # Output the HTTP code and response
    echo "Task $i: HTTP Status $http_code"

    # Implement a random sleep (for anti-detection)
    sleep_time=$(awk -v min=0.1 -v max=0.3 'BEGIN{srand(); print min+rand()*(max-min)}')
    sleep $sleep_time
done

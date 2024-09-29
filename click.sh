#!/bin/bash

# Prompt the user for their API token
while [ -z "$token" ]; do
    read -p "Please enter your API token: " token < /dev/tty
done

# Loop through task IDs from 1 to 500
for i in {1..500}
do
    # Make the POST request with the token in the Authorization header and capture the HTTP code separately
    http_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST "https://api.catshouse.club/tasks/$i/complete" \
    -H "Authorization: $token" \
    -H "Content-Type: application/json")

    # Output the HTTP code
    echo "Task $i: HTTP Status $http_code"

    # Random sleep between 100ms and 300ms
    sleep $(awk -v min=0.1 -v max=0.3 'BEGIN{srand(); print min+rand()*(max-min)}')
done

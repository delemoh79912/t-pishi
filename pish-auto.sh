#!/bin/bash

# Prompt for API token
echo "Enter your API token:"
read api_token

# Construct the curl command with the placeholder token
curl_command="curl -X POST 'https://api.catshouse.club/tasks/{task_id}/complete' -H 'Authorization: $api_token'"

# Iterate over task IDs and execute curl commands with a delay
for task_id in {1..500}; do
    curl_result=$(eval "$curl_command")
    echo "Task $task_id: $curl_result"

    # Add a 3-second delay
    sleep 3
done

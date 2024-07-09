#!/bin/bash

# PROJECT_ID="your-project-id"
# TOPIC_NAME="your-topic-name"
# SUBSCRIPTION_NAME="your-subscription-name"

PROJECT_ID="drone-navigation-428814"
TOPIC_NAME="drone-positions-topic"
SUBSCRIPTION_NAME="drone-positions-subscription"


echo "Create Pub/Sub topic:"
gcloud pubsub topics create "$TOPIC_NAME" \
    --project="$PROJECT_ID"

if [ $? -ne 0 ]; then
    echo "Failed to create Pub/Sub topic '$TOPIC_NAME'."
    exit 1
fi


echo "Create Pub/Sub subscription:"
gcloud pubsub subscriptions create "$SUBSCRIPTION_NAME" \
    --topic="$TOPIC_NAME" \
    --project="$PROJECT_ID"

if [ $? -ne 0 ]; then
    echo "Failed to create Pub/Sub subscription '$SUBSCRIPTION_NAME'."
    exit 1
fi

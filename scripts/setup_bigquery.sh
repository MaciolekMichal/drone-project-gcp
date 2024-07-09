#!/bin/bash

# PROJECT_ID="your-project-id"
# DATASET_NAME="your-dataset-name"
# TABLE_NAME="your-table-name"
# SCHEMA_FILE="your-schema-file.json"

PROJECT_ID="drone-navigation-428814"
DATASET_NAME="drone_data"
TABLE_NAME="drone_positions"
SCHEMA_FILE="./drone_positions_schema.json"


echo "Create BigQuery dataset:"
bq --location=EU \
    mk --dataset \
    --description "Dataset for drone data" \
    "$PROJECT_ID:$DATASET_NAME"

if [ $? -ne 0 ]; then
    echo "Failed to create BigQuery dataset '$PROJECT_ID:$DATASET_NAME'."
    exit 1
fi


echo "Create BigQuery table:"
bq mk --table \
    --schema=$SCHEMA_FILE \
    "$PROJECT_ID:$DATASET_NAME.$TABLE_NAME"

if [ $? -ne 0 ]; then
    echo "Failed to create BigQuery table '$PROJECT_ID:$DATASET_NAME.$TABLE_NAME'."
    exit 1
fi
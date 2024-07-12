import json

from google.cloud import bigquery

from  config import TABLE_ID


bigquery_client = bigquery.Client()


def insert_into_bigquery(data):
    errors = bigquery_client.insert_rows_json(TABLE_ID, data)

    if errors:
        print(f"Failed to insert data into BigQuery: {errors}")
    else:
        print("Data inserted successfully.")


def callback(message):
    try:
        data = json.loads(message.data)
        print(f"Received message: {data}")
        
        insert_into_bigquery(data)
        message.ack()

    except Exception as e:
        print(f"Error processing message: {e}")
        message.nack()

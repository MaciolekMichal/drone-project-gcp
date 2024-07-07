import json

from google.cloud import bigquery
from google.cloud import pubsub_v1

PROJECT_ID = "kubernetes-drone-428215"
TOPIC_NAME = "drone-topic"
SUBSCRIPTION_NAME = "drone-subscription"

table_id = "kubernetes-drone-428215.drone_data.drone_positions"
topic_path = f"projects/{PROJECT_ID}/topics/{TOPIC_NAME}" 
subscription_path = f"projects/{PROJECT_ID}/subscriptions/{SUBSCRIPTION_NAME}" 

bigquery_client = bigquery.Client()
pubsub_client = bigquery.Client()


def insert_into_bigquery(data):
    errors = bigquery_client.insert_rows_json(table_id, data)

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


with pubsub_v1.SubscriberClient() as subscriber:
    future = subscriber.subscribe(subscription_path, callback)
    try:
        future.result()
    except KeyboardInterrupt:
        future.cancel()

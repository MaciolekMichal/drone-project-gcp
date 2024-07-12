from google.cloud import pubsub_v1

from config import SUBSCRIPTION_PATH
from helpers import callback


def main():
    with pubsub_v1.SubscriberClient() as subscriber:
        future = subscriber.subscribe(SUBSCRIPTION_PATH, callback)
        
        try:
            future.result()
        except KeyboardInterrupt:
            future.cancel()
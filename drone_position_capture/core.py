from google.cloud import pubsub_v1

from drone_position_capture.config import SUBSCRIPTION_PATH
from drone_position_capture.helpers import callback



def main():
    with pubsub_v1.SubscriberClient() as subscriber:
        future = subscriber.subscribe(SUBSCRIPTION_PATH, callback)
        
        try:
            future.result()
        except KeyboardInterrupt:
            future.cancel()

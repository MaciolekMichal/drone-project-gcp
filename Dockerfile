FROM python:3.8-slim

WORKDIR /app

COPY ./requirements.txt /app/
COPY ./drone_position_capture/ /app/drone_position_capture/

RUN pip install --no-cache-dir -r /app/requirements.txt

ENV GOOGLE_APPLICATION_CREDENTIALS="/etc/secrets/drone-key.json" \
    PROJECT_ID="drone-navigation-428814" \
    DRONE_POSITIONS_TOPIC="drone-positions-topic" \
    DRONE_POSITIONS_SUBSCRIPTION="drone-positions-subscription" \
    DRONE_DATASET_NAME="drone_data" \
    DRONE_POSITIONS_TABLE_NAME="drone_positions"

CMD ["python", "drone_position_capture/app.py"]
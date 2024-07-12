FROM python:3.8-slim

WORKDIR /app

COPY ./requirements.txt /app/
COPY ./drone_position_capture/ /app/drone_position_capture/

RUN pip install --no-cache-dir -r /app/requirements.txt

CMD ["python", "drone_position_capture/app.py"]
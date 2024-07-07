# Drone Navigation Project

## Overview

This project is designed to process drone position data using Google Cloud services, including BigQuery and Pub/Sub. The application listens for messages from a Pub/Sub topic, processes the data, and inserts it into a BigQuery table for further analysis.

## Project Structure

- **app.py**: The main application script that handles data processing and insertion into BigQuery.
- **Dockerfile**: Defines the Docker image for the application.
- **deployment.yaml**: Kubernetes deployment configuration for deploying the application.

## Setup Instructions

### Prerequisites

- Python 3.8
- Docker
- Google Cloud SDK
- Access to a Google Cloud project with BigQuery and Pub/Sub enabled

## Future Improvements

This project is a work in progress and will be improved and polished over time. Upcoming enhancements include:

- Detailed documentation on setup and usage
- Robust error handling and logging
- Comprehensive test coverage

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.


For any questions or support, please contact michal.maciolek3@gmail.com.

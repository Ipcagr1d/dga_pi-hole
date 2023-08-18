# Overview

A simple experimental setup was developed to improve Pi-hole’s ability to detect DGA domains using a deep learning model. The Pi-hole blocklist was enriched by the deep learning model, which was trained on DNS requests queried by Pi-hole. If the model detected a DGA domain, a Python script would create a new custom blocklist that would be merged with the default blocklist in gravity. It is recommended to run the model and enrich the blocklist first, as the model cannot operate in real-time.

## Table of Contents

1. Installation
2. Usage
3. Folders & Files
4. Dependencies
5. Contributing

## Installation

Docker images are available for this project, allowing you to pull them without building from scratch. You can find the image at the following URL: https://hub.docker.com/repository/docker/ipcagr1d/pi-hole_dga/general

If you prefer to build from scratch, you can follow these steps:

Clone the repositories and their dependencies by running the get_dependency.sh script. Then, initialize the pre-configured (or modify as needed) Pi-hole container by navigating to the pi-hole folder and running docker-compose up.
Initialize the DGA detection module and re-train it if necessary.
Copy the module to the running Pi-hole container and set up a cron job.

## 2. Usage

To use the modified Pi-hole, you can first run the Python script to generate an initial custom blocklist. Then, add the URL of the blocklist to the Pi-hole configuration and set up a cron job.

In terms of functionality, there are no changes from the standard Pi-hole.

## 3. Folders & Files

- `pi-hole` contains the Docker Compose file for the Pi-hole container, you can change the container configurations from this file.
- `env_check.ps1` and `set_machine_dns_win.ps1` are optional. This will check your network cofigurations to check the fundamentals config for the container.
- `get_dependency.sh` is for dependency of the modified Pi-hole containg the functionalities from another repo to add the model and the script.

## 4. Dependencies

- Docker Desktop
- Python

## 5. Contributing

Contributions to the project are welcome. If you encounter any issues or have suggestions for improvements, please submit them through the project's GitHub repository.

#!/bin/bash
xhost +local:root
docker-compose run mir-simulation
xhost -local:root

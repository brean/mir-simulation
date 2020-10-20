# mir-simulation

docker-compose file and run script for MIR-100 robot simulation.

## installation and running

1. install docker (aka moby for Fedora 32 and up), docker-compose and xhost (if not installed already)
1. run "run.bash", it will create the environment and start the robot in simulation and opens an window showing rviz.

## Presentation

This repository provides a gazebo-based simulation using RIVZ as interface, it also starts rqt-robot-steering for easy robot control

![](docs/mir-100-docker-compose.gif)

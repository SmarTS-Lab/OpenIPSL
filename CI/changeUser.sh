#!/bin/bash
useradd smartslab
sudo chmod -R 777 /OpenIPSL
export DISPLAY=localhost:0 # Set environment variable for creating plots in python
sudo -u smartslab -H sh -c "python /OpenIPSL/CI/runTests.py"

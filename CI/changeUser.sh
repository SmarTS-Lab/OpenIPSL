#!/bin/bash
useradd smartslab
sudo -u smartslab -H sh -c "python /OpenIPSL/CI/runTests.py"

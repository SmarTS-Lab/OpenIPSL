#!/bin/bash
useradd smartslab
sudo -u smartslab -H sh -c "python /OpenIPSL/runTests.py"

#!/bin/bash
docker run --name speedtestw -p 3001:80 -d -v $(pwd)/mnt/data.csv:/mnt/data.csv speedtestw:latest
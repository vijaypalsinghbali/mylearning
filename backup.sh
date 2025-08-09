#!/bin/bash

timestamp=$(date +'%Y-%m-%d_%H-%M-%S')
mkdir -p /mnt/data/backups/$timestamp
cp -r /mnt/data/NNV3-preprod-api /mnt/data/backups/$timestamp/

# Create tar.gz of that timestamped folder
cd /mnt/data/backups
tar -czvf NNV3-preprod-api-backup.tar.gz $timestamp
mv NNV3-preprod-api-backup.tar.gz $timestamp
aws s3 cp /mnt/data/backups/$timestamp/NNV3-preprod-api-backup.tar.gz s3://infra-automation-conf-911609873560/preprod/nn-backend/last-deployment-backup/NNV3-preprod-api-backup$timestamp.tar.gz

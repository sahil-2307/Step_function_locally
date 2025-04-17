#!/bin/bash
set -e  # Exit immediately on error

# Configuration
WORKSPACE_LOCATION=~/Step_Function_Locally/glue-local-poc
PROFILE_NAME=default  # Your AWS CLI profile
GLUE_IMAGE=public.ecr.aws/glue/aws-glue-libs:5

# Job 1: Read CSV
echo "Starting CSV Reader Job..."
docker run -it --rm \
  -v ~/.aws:/home/hadoop/.aws \
  -v $WORKSPACE_LOCATION:/home/hadoop/workspace/ \
  -e AWS_PROFILE=$PROFILE_NAME \
  --name glue5_read_csv \
  $GLUE_IMAGE \
  spark-submit /home/hadoop/workspace/src/read_csv.py --JOB_NAME read_csv

# Job 2: Display Data
echo -e "\nStarting Data Display Job..."
docker run -it --rm \
  -v ~/.aws:/home/hadoop/.aws \
  -v $WORKSPACE_LOCATION:/home/hadoop/workspace/ \
  -e AWS_PROFILE=$PROFILE_NAME \
  --name glue5_display_data \
  $GLUE_IMAGE \
  spark-submit /home/hadoop/workspace/src/display_data.py --JOB_NAME display_data

echo -e "\nBoth jobs completed successfully!"

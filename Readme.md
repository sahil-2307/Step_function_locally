# Implementing AWS Glue Jobs Locally Using Docker with Step Functions for Orchestration

## Step 1 :- Install SAM and AWS CLI using homebrew

To do this run the below commands in the terminal

```bash
 brew install awscli
 brew install aws-sam-cli
```

## Step 2 :- Pull AWS Glue Image and AWS Step Function Image

Open Docker and using the terminal pull the images of Glue and Step Function. To do this run the below commands in Docker terminal.

```bash
docker pull public.ecr.aws/glue/aws-glue-libs:5

docker pull amazon/aws-stepfunctions-local
```

#!/bin/bash

S3_BUCKET_NAME=cfn-python-flask-hello

set -o errexit -o xtrace

aws s3api head-bucket --bucket "${S3_BUCKET_NAME}" || aws s3 mb "s3://${S3_BUCKET_NAME}"

aws s3api put-bucket-policy --bucket "${S3_BUCKET_NAME}" \
  --policy "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":[\"s3:GetObject\",\"s3:GetObjectVersion\"],\"Resource\":\"arn:aws:s3:::${S3_BUCKET_NAME}/*\"},{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":[\"s3:ListBucket\",\"s3:GetBucketVersioning\"],\"Resource\":\"arn:aws:s3:::${S3_BUCKET_NAME}\"}]}" \

aws s3api put-bucket-versioning --bucket "${S3_BUCKET_NAME}"  --versioning-configuration Status=Enabled

aws s3 cp ../ecs-refarch-continuous-deployment.yaml "s3://${S3_BUCKET_NAME}"

aws s3 cp --recursive ../templates/ "s3://${S3_BUCKET_NAME}/templates"

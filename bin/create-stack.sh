aws cloudformation create-stack \
  --stack-name washiz-flask-hello-stack  \
  --template-body https://s3-ap-northeast-1.amazonaws.com/cfn-python-flask-hello/ecs-refarch-continuous-deployment.yaml \
  --parameters ParameterKey=VpcId,ParameterValue=vpc-0110c12cd71389548 \
               ParameterKey=SubnetId1,ParameterValue=subnet-01ce5672ae588ed31 \
               ParameterKey=SubnetId2,ParameterValue=subnet-002326bc80feff434 \
               ParameterKey=LaunchType,ParameterValue=Fargate \
               ParameterKey=GitRepo,ParameterValue=python-flask-hello \
               ParameterKey=GitBranch,ParameterValue=master \
               ParameterKey=TemplateBucket,ParameterValue=cfn-python-flask-hello \
  --capabilities CAPABILITY_IAM

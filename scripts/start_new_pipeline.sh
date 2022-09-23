#!/bin/bash
STATUS="$(aws codepipeline list-pipeline-executions --pipeline-name ismail --region ap-southeast-2 | grep '"status": "Succeeded"' | sort -u)"
OUTPUT='("status": "Succeeded",)'
if [[ "${STATUS}"="${OUTPUT}" ]]; then
    aws codepipeline start-pipeline-execution --name nodejs-express-on-aws-ec2-1 --region ap-southeast-2
else
    echo " Pipeline got failed "
    exit 1
fi

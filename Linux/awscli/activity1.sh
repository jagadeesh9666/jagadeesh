#!/bin/bash
aws ec2 create-security-group `
    --description "rds security group" `
    --group-name "cli group" `
    --vpc-id "vpc-0f8783e567c594f01" `
    --tag-specifications "ResourceType=security-group,Tags=[{Key=security,Value=cli}]"
## output
#{
#   "GroupId": "sg-0b63283e3a250058e",
#    "Tags": [
#        {
#            "Key": "security",
#            "Value": "cli"
#        }
#    ]
#}

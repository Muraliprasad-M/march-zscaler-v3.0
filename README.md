Repository: zscaler-st-v2.1

This Terraform project deploys:
- 2 Zscaler appliances (AZ-A and AZ-B)
- Gateway Load Balancer
- Transit Gateway inspection route automation
- CloudWatch logs encrypted with KMS
- VPC Flow Logs with 366-day retention

Deploy:
terraform init
terraform plan
terraform apply

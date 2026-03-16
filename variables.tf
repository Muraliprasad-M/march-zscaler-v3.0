variable "aws_region" {
  default = "eu-west-2"
}

variable "zscaler_ami" {
  description = "AMI for Zscaler appliance"
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "route_table_id" {
  description = "Inspection VPC route table ID"
}

variable "inspection_vpc_attachment_id" {
  description = "Transit Gateway attachment ID for inspection VPC"
}

variable "tgw_route_table_name" {
  default = "st-inspection-rt"
}

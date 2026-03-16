data "aws_vpc" "st_vpc" {
  filter {
    name   = "tag:Name"
    values = ["st-vpc"]
  }
}

data "aws_subnet" "private_a" {
  filter {
    name   = "tag:Name"
    values = ["st-private-a"]
  }
}

data "aws_subnet" "private_b" {
  filter {
    name   = "tag:Name"
    values = ["st-private-b"]
  }
}

data "aws_nat_gateway" "st_nat" {
  filter {
    name   = "tag:Name"
    values = ["st-nat"]
  }
}

data "aws_ec2_transit_gateway" "st_tgw" {
  filter {
    name   = "tag:Name"
    values = ["st-tgw"]
  }
}

data "aws_kms_key" "cw_kms" {
  key_id = "alias/st-cloudwatch-kms"
}

data "aws_iam_role" "flowlogs_role" {
  name = "st-vpc-flowlogs-role"
}

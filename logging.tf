resource "aws_cloudwatch_log_group" "zscaler_logs" {

  name              = "/st/zscaler/inspection"
  retention_in_days = 366
  kms_key_id        = data.aws_kms_key.cw_kms.arn

  tags = {
    Name = "st-zscaler-logs"
  }
}

resource "aws_flow_log" "inspection_vpc_logs" {

  vpc_id = data.aws_vpc.st_vpc.id

  traffic_type = "ALL"

  log_destination_type = "cloud-watch-logs"

  log_group_name = aws_cloudwatch_log_group.zscaler_logs.name

  iam_role_arn = data.aws_iam_role.flowlogs_role.arn

  tags = {
    Name = "st-inspection-vpc-flowlogs"
  }
}

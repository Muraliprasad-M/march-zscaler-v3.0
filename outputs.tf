output "zscaler_a_private_ip" {
  value = aws_instance.zscaler_a.private_ip
}

output "zscaler_b_private_ip" {
  value = aws_instance.zscaler_b.private_ip
}

output "gwlb_arn" {
  value = aws_lb.zscaler_gwlb.arn
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.zscaler_logs.name
}

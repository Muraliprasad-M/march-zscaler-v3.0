resource "aws_ec2_transit_gateway_route_table" "inspection_rt" {

  transit_gateway_id = data.aws_ec2_transit_gateway.st_tgw.id

  tags = {
    Name = var.tgw_route_table_name
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "inspection_assoc" {

  transit_gateway_attachment_id  = var.inspection_vpc_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.inspection_rt.id
}

resource "aws_ec2_transit_gateway_route" "default_to_inspection_vpc" {

  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = var.inspection_vpc_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.inspection_rt.id
}

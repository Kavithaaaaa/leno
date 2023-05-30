resource "aws_route_table_association" "pubassociation-1" {
  subnet_id      = aws_subnet.pubsub-1.id
  route_table_id = aws_route_table.pubrt-1.id
}

resource "aws_route_table_association" "pubassociation-2" {
  subnet_id      = aws_subnet.pubsub-2.id
  route_table_id = aws_route_table.pubrt-1.id
}

resource "aws_route_table_association" "privassociation-1" {
  subnet_id      = aws_subnet.pvtsub-1.id
  route_table_id = aws_route_table.privrt-1.id
}

resource "aws_route_table_association" "privassociation-2" {
  subnet_id      = aws_subnet.pvtsub-2.id
  route_table_id = aws_route_table.privrt-2.id
}
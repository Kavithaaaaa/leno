resource "aws_nat_gateway" "tnat-1" {
  allocation_id = aws_eip.eip-1.id
  subnet_id     = aws_subnet.pubsub-1.id
  tags = {
    Name = "natgw-1"
  }
}


resource "aws_nat_gateway" "tnat-2" {
  allocation_id = aws_eip.eip-2.id
  subnet_id     = aws_subnet.pubsub-2.id
  tags = {
    Name = "natgw-2"
  }
}
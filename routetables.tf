resource "aws_route_table" "pubrt-1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tigw.id
  }

  tags = {
    Name = "publicRT"
  }
}

resource "aws_route_table" "privrt-1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tnat-1.id
  }

  tags = {
    Name = "privateRT"
  }
}

resource "aws_route_table" "privrt-2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tnat-2.id
  }

  tags = {
    Name = "privateRT-2"
  }
}


resource "aws_subnet" "pubsub-1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "152.0.0.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "publicsubnet-1a"
    "kubernetes.io/role/elb"    = "1"
    "kubernetes.io/cluster/eks" = "shared"

  }
}


resource "aws_subnet" "pubsub-2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "152.0.32.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "publicsubnet-1b"
    "kubernetes.io/role/elb"    = "1"
    "kubernetes.io/cluster/eks" = "shared"

  }
}

resource "aws_subnet" "pvtsub-1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "152.0.64.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name                              = "privatesubnet-1"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks"       = "shared"
  }
}


resource "aws_subnet" "pvtsub-2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "152.0.96.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name                              = "privatesubnet-2"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks"       = "shared"
  }
}

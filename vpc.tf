
resource "aws_vpc" "myvpc" {
  cidr_block       = "152.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  assign_generated_ipv6_cidr_block = false



  tags = {
    Name = "terraformvpc"
  }
}

output "vpc_id" {
    value = aws_vpc.myvpc.id
    description = "VPC.id"
    sensitive = false  
}
resource "aws_eip" "eip-1" {
  depends_on = [ aws_internet_gateway.tigw ]
}

resource "aws_eip" "eip-2" {
  depends_on = [ aws_internet_gateway.tigw ]
 }
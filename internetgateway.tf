resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-first-gateway"
  }
}


resource "aws_route_table" "Public-Subnet-RT" {
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.gw
  ]

   # VPC ID
  vpc_id = aws_vpc.main.id

  # NAT Rule
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Route Table for Internet Gateway"
  }
}



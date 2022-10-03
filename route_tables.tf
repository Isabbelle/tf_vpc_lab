#google how to create route_table 

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id  #internet gateway name 
  }

  tags = {
    Name = "public-rt"  # public-rt
  }
}

#a route is file that is going to give a direction if you want to go somewhenre 


#create private route 

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id  #nat gateway name  
  }

  tags = {
    Name = "private-rt"  # private-rt
  }
}

#now associate routes to public and private subnets

resource "aws_route_table_association" "public_rt_assoc_A" {
  subnet_id      = aws_subnet.subnetOne.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc_B" {
  subnet_id      = aws_subnet.subnetTwo.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_rt_assoc_C" {
  subnet_id      = aws_subnet.subnetThree.id
  route_table_id = aws_route_table.public_rt.id
}

# route association to private subnets
resource "aws_route_table_association" "pSubnetOne_assoc_A" {
  subnet_id      = aws_subnet.pSubnetOne.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "pSubnetTwo_assoc_B" {
  subnet_id      = aws_subnet.pSubnetTwo.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "pSubnetOne_assoc_C" {
  subnet_id      = aws_subnet.pSubnetThree.id
  route_table_id = aws_route_table.private_rt.id
}


#in terminal control + r 
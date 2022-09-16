
resource "aws_subnet" "pSubnetOne" {
  depends_on = [
    aws_vpc.main,
    aws_subnet.subnetOne
  ]
  
  
  vpc_id = aws_vpc.main.id
  
 
  cidr_block = "192.168.11.0/24"
  

  availability_zone = "eu-central-1a"
  
  tags = {
    Name = "Private SubnetOne"
  }
}

resource "aws_subnet" "pSubnetTwo" {
  depends_on = [
    aws_vpc.main,
    aws_subnet.subnetOne
  ]
  
  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.main.id
  
  # IP Range of this subnet
  cidr_block = "192.168.12.0/24"
  
  # Data Center of this subnet.
  availability_zone = "eu-central-1b"
  
  tags = {
    Name = "Private SubnetTwo"
  }
}

resource "aws_subnet" "pSubnetThree" {
  depends_on = [
    aws_vpc.main,
    aws_subnet.subnetOne
  ]
  
  
  vpc_id = aws_vpc.main.id
  
 
  cidr_block = "192.168.13.0/24"
  

  availability_zone = "eu-central-1c"
  
  tags = {
    Name = "Private SubnetThree"
  }
}

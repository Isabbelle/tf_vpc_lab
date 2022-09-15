

resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"
  tags= {
    Name="main"
  }
 
}

resource "aws_subnet" "subnetOne"{
    depends_on = [
      aws_vpc.main
    ]
    vpc_id=aws_vpc.main.id
    cidr_block= "192.168.1.0/24"
    availability_zone= "eu-central-1a"
    tags = {
        Name="Public subnetOne"
    }
}

resource "aws_subnet" "subnetTwo"{
    depends_on = [
      aws_vpc.main
    ]
    vpc_id=aws_vpc.main.id
    cidr_block= "192.168.2.0/24"
    availability_zone= "eu-central-1b"
    tags = {
        Name="Public subnetTwo"
    }
}

resource "aws_subnet" "subnetThree"{
    depends_on = [
      aws_vpc.main
    ]
    vpc_id=aws_vpc.main.id
    cidr_block= "192.168.3.0/24"
    availability_zone= "eu-central-1c"
    tags = {
        Name="Public subnetThree"
    }
}


resource "aws_subnet" "pSubnetOne" {
  depends_on = [
    aws_vpc.main,
    aws_subnet.subnetOne
  ]
  
  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.main.id
  
  # IP Range of this subnet
  cidr_block = "192.168.11.0/24"
  
  # Data Center of this subnet.
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
  
  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.main.id
  
  # IP Range of this subnet
  cidr_block = "192.168.13.0/24"
  
  # Data Center of this subnet.
  availability_zone = "eu-central-1c"
  
  tags = {
    Name = "Private SubnetThree"
  }
}
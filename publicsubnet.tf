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
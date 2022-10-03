resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id  # aws_wip the term for the creation of public ip addresses. it fives you an ip address. you pay if you dont use the ip 
  subnet_id     = aws_subnet.subnetOne.id
  connectivity_type = public

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]    #this is a medata. when you work in terraform, terraform plan looks at the files and says which has to be created first, it has some priority process, however sometimes because of aws, it takes time to create instances and terraform doesnt wait enough time to create the isntance. something can be done in 10 sec sometimes in 40 sec. sometimes there are issues so it takes longer especially for nat gateway and it takes more time. it;s a big instance. and usually we want internet gateway first and the NAT. terraform doesnt wait for internet gateway. terraform i want you wait for the internet gateway to finish. depends_on=[] in most cases we don't need it but in this case yes. 

}

#create elastic ip 

resource "aws_eip " " nat_eip" {
    vpc = true 
    #we have to declare where it will be

}


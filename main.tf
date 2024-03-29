resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "prod-gw"
  }
}

resource "aws_route_table" "prod-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "prod-rt"
  }
}


resource "aws_route_table_association" "subnet-1-to-prod-rt" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.prod-rt.id
}



resource "aws_instance" "jocker" {
  ami           = "ami-0c7217cdde317cfec" #Ubuntu server 22.04 
  instance_type = "t2.micro"
}





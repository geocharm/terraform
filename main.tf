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

resource "aws_instance" "jocker" {
  ami           = "ami-0c7217cdde317cfec" #Ubuntu server 22.04 
  instance_type = "t2.micro"
}





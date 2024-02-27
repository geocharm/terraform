terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["/home/donquixote/.aws/credentials"]
}


resource "aws_instance" "jocker" {
  ami           = "ami-0c7217cdde317cfec" #Ubuntu server 22.04 
  instance_type = "t2.micro"
}



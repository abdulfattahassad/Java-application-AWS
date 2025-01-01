terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

provider "aws" {
  region = var.aws_region
}



resource "aws_instance" "nexusandsonarinstance" {
  ami           =  var.ami
  instance_type =  var.instance_type
  count = var.number
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.keypair1           
  public_key = file("~/.ssh/id_rsa.pub") 
}
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

resource "aws_key_pair" "keys" {
  key_name   = var.keys          
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEosSxHvUgbiIX/8vgiNTr3woCvAoxJY4cg8C9cCLcqJmyYeoe57dwzsITASkY+qpK57spiT114fhgEseAxqrHtueHUdP0IYkd+PLdvX+d3LfVxS4Co5/+1XnusZZ9hkWK4bgu9Ybf/RN1+YzQ8jiobSC1zkmtC5oopM/r/0M+iadIPzzk2ge7c7MGwGg2E60MmzJC/AfrZ4Gh3Gndv81hlHqwkhc9ciqf9A14ylx72pom/dwTm9xQkzxDvn6hDA8tybI+npFzRACpgN+d4m0aQQAU+NgJKkTXdZRxD5uPMfCiZ/5n+sn/ay+qB6dw5Jo9jGHyWA+BUh1b7Rw/i5W1 keypair1"
}
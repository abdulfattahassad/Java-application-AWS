provider "aws" {
  region = var.aws-region
}



resource "aws_instance" "nexus_Instance and sonar instance" {
  ami           =  var.ami
  instance_type =  var.instance_type
  count = var.count
}
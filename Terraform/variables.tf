variable "aws_region" {
  type        = string
  description = "Choose your AWS Region "
  default = "us-east-1"
}

variable "ami"{

  type        = string
  description = "AWS Ec2 AMI "
  default =  "ami-01816d07b1128cd2d"

}


variable "instance_type" {
  description = "AWS ec2 type"
  default = "t2.micro"
}

variable "instance_type" {
  description = "number of ec2"
  default = 2
  type = int
}
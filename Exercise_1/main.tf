# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
  access_key = "AKIAUDZ6C5IRRHZYFJNG"
  secret_key = "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"
  region = "us-east-1"
}
 

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "Udacity_T2" {
  count = "4"
  ami = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"
  tags = {
    name = "Udacity Terraform T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "Udacity_M4" {
  count = "2"
  ami = "ami-06b09bfacae1453cb"
  instance_type = "m4.large"
  tags = {
    name = "Udacity Terraform M4"
  }
}
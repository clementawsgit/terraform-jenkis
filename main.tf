terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Creation of aws provider
  provider "aws" {
  region = "us-east-1"
  access_key = "AKIAWCZC5ZCVWFTGYAOM"
  secret_key = "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"
}

#Creation of aws instance
resource "aws_instance" "myec2" {
instance_type = "t2.micro"
key_name = "ubuntu"
ami = "ami-04b4f1a9cf54c11d0"
tags = {
    Name = "clement-terraform"
}
}

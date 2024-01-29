provider "aws" {
region = "eu-north-1"
}

resource "aws_instance" "servers" {
  for_each = toset(["Master", "worker-1", "worker-2", "worker-3", "worker-4", "Monitor", "Sonarube"])
  ami           = "ami-0331ac5c6d19b3f74"
  instance_type = "t3.micro"

  tags = {
    Name = "${each.key}"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "nuvunene1.k8s.local"
}

resource "aws_s3_bucket_versioning" "my_bucket" {
  bucket = "nuvunene1.k8s.local"
  versioning_configuration {
    status = "Enabled"
  }
}
/*
terraform {
  backend "s3" {
    bucket = "swiggyterraformbucket001"
    key    = "terraform.tfstate"
    region = "us-east-1"
    versioning {
    enabled = true
  }
  }
}
*/

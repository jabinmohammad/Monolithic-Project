resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type

  dynamic "tag" {
    for_each = var.server_names
    content {
      key   = each.key
      value = each.value
    }
  }

  tags = {
    Name = dynamic.tag.0.content.value
  }
}
resource "aws_s3_bucket" {
  bucket = "goodatlucks"
  region = "eu-north-1"
  #key    = "terraform.tfstate"
  versioning {
    enabled = true
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

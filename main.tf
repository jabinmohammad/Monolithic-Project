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


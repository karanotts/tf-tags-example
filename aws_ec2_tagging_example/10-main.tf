resource "aws_instance" "foo" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = local.tags
}

resource "null_resource" "example" {}

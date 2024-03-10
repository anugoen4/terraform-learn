resource "aws_instance" "this" {
    ami           = var.ami
    instance_type = var.instance_type

    user_data = file("${path.module}/userdata.sh")
    tags = {
        Name = var.name
    }
}
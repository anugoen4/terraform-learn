# module "ec2-instance" {
#   source        = "./modules/ec2-instance"
#   name          = var.name
#   instance_type = var.instance_type
#   ami           =  var.ami
#   tags = {
#     Name = var.name
#   }
# }

module "cluster-asg" {
  source        = "./modules/cluster-asg"
  name          = var.name
  instance_type = var.instance_type
  ami           =  var.ami
  subnet_ids = var.subnet_ids
  tags = {
    Name = var.name
  }
}


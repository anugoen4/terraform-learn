variable "name" {
  default = "test-ec2-ag"
}

variable "ami" {
  default = "<AMI>"
}

variable "instance_type" {
  default = "t2.micro"
}

variable subnet_ids {
  type = list(string)
  default = ["<SUBNET_ID>"]
}
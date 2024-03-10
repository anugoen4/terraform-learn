resource "aws_launch_template" "asg-lt" {
    name_prefix = "${var.name}-lt"
    image_id = var.ami
    instance_type = var.instance_type
    user_data = filebase64("${path.module}/userdata.sh")
    security_group_names = ["common"]
}

resource "aws_autoscaling_group" "asg" {
    name                 = "${var.name}-asg"
    min_size             = 1
    max_size             = 3
    desired_capacity     = 2
    vpc_zone_identifier  = var.subnet_ids
    launch_template {
        id      = aws_launch_template.asg-lt.id
        version = "$Latest"
    }
    tag {
        key                 = "ASG-TF"
        value               = "${var.name}-asg"
        propagate_at_launch = false
    }
}
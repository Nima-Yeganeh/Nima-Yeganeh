resource "aws_instance" "MyThirdInstance" {
    ami             = lookup(var.AMIS, var.AWS_REGION)
    instance_type   = "t2.micro"  

    tags = {
        Name = "demo_instance"
    }

    security_groups = var.Security_Group
}

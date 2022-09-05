resource "aws_instance" "MyThirdInstance" {
    ami             = ""
    instance_type   = "t2.micro"
    
    tags = {
        Name = "demo_instance"
    }
}

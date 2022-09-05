resource "aws_instance" "MySecondInstance" {
    count           = 3
    ami             = ""
    instance_type   = "t2.micro"
    
    tags = {
        Name = "demo_instance-${count.index}"
    }
}

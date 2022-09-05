variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
    default = "us-east-2"
}

variable "Security_Group" {
    type = list
    default = ["sg-1, "sg-2", "sg-3"]
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-1"
        us-east-2 = "ami-2"
        us-west-1 = "ami-3"
        us-west-2 = "ami-4"
    }
}

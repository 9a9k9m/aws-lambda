variable "aws_region" {
    default = "ap-southeast-1"
}

variable "AMIS" {
    type = map(string)
    default = {
        ap-southeast-1 = "ami-0fed77069cd5a6d6c"
        ap-southeast-2 = "ami-0bf8b986de7e3c7ce"
    }
}



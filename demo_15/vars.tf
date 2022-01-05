variable "AWS_REGION" {
    dafault = "ap-southeast-1"
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "mykey.pub"
}


variable "AMIS" {
    type = map(string)
    default = {
        ap-southeast-1 = "ami-0fed77069cd5a6d6c"
        ap-southeast-2 = "ami-0bf8b986de7e3c7ce"
    }
}
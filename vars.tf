variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}
variable "AWS_REGION"{
    default "ap-southeast-1"
}
variables "AMIS" {
    type = "map" 
    default = {
        ap-southeast-1 = "ami-024221a59c9020e72"
        ap-southeast-2 = " ami-043e0add5c8665836"
    }
}


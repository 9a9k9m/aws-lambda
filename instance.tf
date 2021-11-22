resource   "aws" "first_instance"  {
    ami   =  "${lookup(VAR.AMIS, VAR.AWS_REGION)}"
    instance_type = "t2.micro"
}
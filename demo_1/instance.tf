resource "aws_instance" "first_instance" {
    ami           =  var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"
}
  

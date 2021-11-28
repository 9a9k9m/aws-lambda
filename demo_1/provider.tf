# this command is used to launch ec2 using variables
provider "aws" {
  access_key   =  var.AWS_ACCESS_KEY
  secret_key   =  var.AWS_SECRET_KEY
  region       =  var.AWS_REGION
}

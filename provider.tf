# this command is used to launch ec2 using variables
provider "aws" {
  access_key   =  VAR.AWS_ACCESS_KEY
  secret_key   =  VAR.AWS_SECRET_KEY
  region       =  VAR.AWS_REGION
}

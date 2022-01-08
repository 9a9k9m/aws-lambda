resource "aws_iam_role" "app-ec2-role" {
  name               = "app-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}


resource "aws_iam_instance_profile" "app-ec2-role" {
    name  = "app-ec2-role"
    role  = aws_iam_role.app-ec2-role.name
}

# service

resource "aws_iam_role" "app-ec2-role" {
  name               = "app-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "elasticbeanstalk.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}


# policies

resource "aws_iam_policy_attachment" "app-attach-1" {
    name        = "app-attach-1"
    roles       = [aws_iam_role.app-ec2-role.name]
    policy_arm  = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_policy_attachment" "app-attach2" {
    name            = "app-attach2"
    roles           = [aws_iam__role.app-ec2-role.name]
    policy_arn      = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_iam_policy_attachment" "app-attach3" {
    name                = "app-attach3"
    roles               = [aws_iam-role.app-ec2-role.name]
    policy_arn          = "arn:aws:iam::aws:policy/AWSElasticbeanstalkWorkerTier"
}

resource "aws_iam_policy_attachment" "app-attach4" {
    name            = "app-attach4"
    roles           = [aws_iam_role.elasticbeanstalk-service-role.name]
    policy_arn      = "arn:aws:iam::policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}


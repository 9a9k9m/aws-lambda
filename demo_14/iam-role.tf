# create IAM role 

resource "aws_iam_role" "s3-mybucket-role" {
    name                = "s3-mybucket-role"
    assume_role_policy  = <<EFO

{
    "version": "2012-10-17",
    "statement": [
        {
            "Action": "sts:AssumeRole",
            "principal": {
                "service": "ec2.amazonaws.com"    
            },

            "Effect": "Allow",
            "Sid":""
        }
    ]
}
EFO

}

resource "aws_iam_instance_profile" "s3-mybucket-role-instanceprofile" {
    name = "s3-mybucket-role"
    role = "aws_iam_role.s3-mybucket-role.name"
}


resource "aws_iam_role_policy" "s3-mybucket-role-policy" {
  name = "test_policy"
  role = aws_iam_role.s3_mybucket_role.id
  policy = <<EOF
{
    Version = "2012-10-17",
    Statement = [
       {
          "Effect": "Allow",
          "Action": [
              "s3:*"
           ],
          "Resorce": [
              "arm:aws:s3:::mybucket-honda987",
              "arn:aws:s3:::mybucket-honda987/*"
           ]
       }
    ] 
}
EOF

}

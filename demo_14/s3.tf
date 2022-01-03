resource "aws_s3_bucket" "b" {
    bucket  = "mybucket-honda987"
    acl     = "private"

    tags = {
        Name = "mybucket-honda987"
    }
}


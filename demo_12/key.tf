resource "aws_key_pair" "sonykey" {
    key_name = "sonykey"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}


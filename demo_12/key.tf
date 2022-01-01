resource "aws_key_pair" "sonykey" {
    Name = "sonykey"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}


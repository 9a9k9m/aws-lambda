resource "aws_key_pair" "mykey" {
    key_name = "firstkey"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}


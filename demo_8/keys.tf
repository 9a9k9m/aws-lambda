resource "aws_key_pair" "mykey" {
    keyname = "mykey"
    public_key = file  (var.PATH_TO_PUBLIC_KEY)
}
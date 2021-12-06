resource "aws_key_pair" "mykeypair" {
    keyname = "mykeypair"
    public_key = file  (var.PATH_TO_PUBLIC_KEY)
}
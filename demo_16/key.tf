resource "aws_key_pair" "mysonykey" {
    key_name = "mysonykey"
    public_key = file(var.PATH_TO_PUBLIC_KEY)

     lifecycle {
        ignore_changes = [public_key]
    }
}
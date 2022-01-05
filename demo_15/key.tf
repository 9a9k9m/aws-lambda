resource "aws_key_pair" "mysonykey" {
    vpc_id = aws_vpc.mian.id
    key_name = "mysonykey"
    public_key = file(var.PATH_TO_PUBLIC_KEY)

    lifecycle {
        ignore_changes = [public_key]
    }
}
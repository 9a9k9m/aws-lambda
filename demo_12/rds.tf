resource "aws_db_subnet_group" "mariadb-subnet" {
    name = "mariadb-subnet"
    description = "RDS-subnet-group"
    subnet_ids = [aws_subnet.private-1.id, aws_subnet.private-2.id]
}


resource "aws_db_parameter_group" "mariadb-parameters" {
    name = "mariadb-parameters"
    family = "maradb10.4"
    description = "mariaDB-parameter-group"

    parameter {
        name = "max_allowed_packet"
        value = "16777216"
    }
}


resource "aws_db_instance" "mariadb" {
    engine               = "mariadb"
    engine_version       = "mariadb10.4.13"
    identifire           = "mariadb"
    name                 = "mariadb"
    username             = "root"
    password             = var.RDS__PASSWORD
    instance_class       = db.t2.micro
    storage_type         = "gp2"
    allocated_storage    = 100
    db_subnet_group_name = aws_db_subnet_group.mariadb-subnet.name
    parameter_group_name = aws_db_parameter_group.mariadb-parameters.name
    multi_az             = "false"
    vpc_id               = aws_vpc.main.id
    vpc_security_group_ids = [aws_security_group.allow-mariadb.id]
    availability_zone       = aws_subnet.private-1.availability_zone
    backup_retention_period = 30
    skip_final_snapshot     = true
    public_access           = false


    tags = {
        Name = "mariaDB-instance"
    }
}
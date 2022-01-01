resource "aws_db_subnet_group" "mariaDB-subnet" {
    name = "mariaDB-subnet"
    description = "RDs-subnet-group"
    subnet_ids = [aws_subnet.private-1.id, aws_subnet.private-2.id]
}


resource "aws_db_parameter_group" "mariaDB-parameters" {
    name = "mariaDB-parameters"
    family = "maraDB10.5"
    description = "mariaDB-parameter-group"

    parameter {
        name = "max_allowed_packet"
        value = "16777216"
    }
}


resource "aws_db_instance" "mariaDB" {
    engine               = "mariaDB"
    engine_version       = "mariaDB10.5"
    identifire           = "mariaDB"
    name                 = "mariaDB"
    username             = "root"
    password             = var.RDS__PASSWORD
    instance_class       = db.t2.micro
    storage_type         = "gp2"
    allocated_storage    = 100
    db_subnet_group_name = aws_db_subnet_group.mariaDB-subnet.name
    parameter_group_name = aws_db_parameter_group.mariaDB-parameters.name
    multi_az             = "false"
    vpc_id               = aws_vpc.main.id
    vpc_security_group_ids = [aws_security_group.allow-mariaDB.id]
    availability_zone       = aws_subnet.private-1.availability_zone
    backup_retention_period = 30
    skip_final_snapshot     = true
    public_access           = final
    

    tags = {
        Name = "mariaDB-instance"
    }
}
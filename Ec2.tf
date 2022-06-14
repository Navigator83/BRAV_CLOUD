# Creating a server for eu-west 2.

resource "aws_instance" "prod-test1" {
	ami              = var.ami
	instance_type    = var.type
	key_name         = "Test_keypair"
	associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.Test-sec-group.id]
  subnet_id              = aws_subnet.Test-public-sub1.id
  availability_zone      = "eu-west-2a"
	
  tags = {
  Name =" prod-test1"
	}
}





resource "aws_instance" "prod-test" {
  ami           = "ami-0a244485e2e4ffd03"
  key_name      ="Test_keypair"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids =[aws_security_group.Test-sec-group.id]
  subnet_id              = aws_subnet.Test-priv-sub2.id
  availability_zone      = "eu-west-2a"

  tags = {
    Name = "prod-test"
  }
}













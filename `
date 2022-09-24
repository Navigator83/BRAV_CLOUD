# Prod-rock-VPC

resource "aws_vpc" "prod-rock-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "PROD-ROCK-vpc"
  }
}

# Test-public-sub1

resource "aws_subnet" "Test-public-sub1" {
  vpc_id     = aws_vpc.prod-rock-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Test-public-sub1"
  }
}

# Test-priv-sub2

resource "aws_subnet" "Test-priv-sub2" {
  vpc_id     = aws_vpc.prod-rock-VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Test-priv-sub2"
  }
}

# Test-public-route-table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.prod-rock-VPC.id



  tags = {
    Name = "public-route-table"
  }
}

# Test-priv-route-table

resource "aws_route_table" "priv-route-table" {
  vpc_id = aws_vpc.prod-rock-VPC.id



  tags = {
    Name = "priv-route-table"
  }
}


# Rock-test-pub-association1

resource "aws_route_table_association" "Test-pub-associa1" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}



resource "aws_route_table_association" "Test-pub-associa2" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

# Rock-test-priv-association1

resource "aws_route_table_association" "Test-priv-associa1" {
  subnet_id      = aws_subnet.Test-priv-sub2.id
  route_table_id = aws_route_table.priv-route-table.id
}


# Rock-test-priv-association2

resource "aws_route_table_association" "Test-priv-associa2" {
  subnet_id      = aws_subnet.Test-priv-sub2.id
  route_table_id = aws_route_table.priv-route-table.id
}

# Test-igw

resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.prod-rock-VPC.id

  tags = {
    Name = "Test-igw"
  }
}

# Test-igw-association with public route table

resource "aws_route" "Test-IGW-association" {
  route_table_id         = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Test-igw.id
}

# Elastic IP for Nat Gateway

resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    Name = "Nat Gateway EIP"
  }
}

# Test-Nat-gateway

#terraform create Nat Gateway in priv-subnet
resource "aws_nat_gateway" "Test-Nat-gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.Test-public-sub1.id

  tags = {
    Name = "Nat_gateway"
  }
}

# Association-Test-Nat- Gateway with priv
resource "aws_route" "Test-Nat-gateway" {
  route_table_id   = aws_route_table.priv-route-table.id
  gateway_id       = aws_nat_gateway.Test-Nat-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

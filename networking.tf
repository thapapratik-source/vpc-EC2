# Create VPC

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = merge(local.common_tags,{
        Name = "My-project"
    })
  
}

# Create Subnet
resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    tags = merge(local.common_tags,{
        Name = "Public-Subnet"
    })
  
}

# Create Internet Gateway

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.main.id

    tags = merge(local.common_tags,{
        Name = "my-igw"
    })
  
}

# Create Route Table

resource "aws_route_table" "my-RT" {
    vpc_id = aws_vpc.main.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id

    }
   tags = merge(local.common_tags,{
        Name = "my-RT"
    })
}

# Create Route table Association
resource "aws_route_table_association" "rt-association" {
    subnet_id = aws_subnet.publicsubnet.id
    route_table_id = aws_route_table.my-RT.id
  
}
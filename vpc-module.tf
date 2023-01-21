module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project}-${var.env}-vpc"
  cidr = var.vpc_cidr_block

  #azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  azs = data.aws_availability_zones.available.names
  #private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = slice(var.private_subnet_cidr_blocks, 0, var.private_subnet_count)
  #public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  public_subnets = slice(var.public_subnet_cidr_blocks, 0, var.public_subnet_count)

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway     = false

  tags = var.resource_tags
}


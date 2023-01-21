module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "${var.project}-${var.env}-jump-host"

  #ami                    = data.aws_ami.amazon_linux.id
  ami                    = var.centos_ami_id
  instance_type          = var.instance_type
  subnet_id              = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids = [module.security_group_public.security_group_id]
  monitoring             = false
  key_name               = aws_key_pair.kp.key_name

  associate_public_ip_address = true

  tags = var.resource_tags
}

resource "aws_eip" "example" {
  vpc = true

}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.id
  allocation_id = aws_eip.example.id
}


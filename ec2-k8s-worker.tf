module "k8s-worker" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  count   = var.worker_instance_count

  name = "${var.project}-${var.env}-k8s-worker-${count.index + 1}"

  #  ami                         = data.aws_ami.amazon_linux.id
  ami                         = var.centos_ami_id
  key_name                    = aws_key_pair.kp.key_name
  instance_type               = var.worker_instance_type
  monitoring                  = false
  subnet_id                   = element(module.vpc.private_subnets, 0)
  associate_public_ip_address = false
  vpc_security_group_ids      = [module.security_group_private.security_group_id]

  tags = var.resource_tags

  enable_volume_tags = false
  root_block_device = [
    {
      encrypted   = false
      volume_type = "gp2"
      volume_size = 10
    },
  ]
}

resource "aws_ebs_volume" "k8s-worker-ebs-vol" {
  count = var.worker_instance_count * var.ebs_volume_count

  availability_zone = data.aws_availability_zones.available.names[0]
  size              = var.ec2_ebs_volume_size[count.index % var.ebs_volume_count]
  tags              = var.resource_tags
}


resource "aws_volume_attachment" "k8s-worker-vol-attach" {
  count = var.worker_instance_count * var.ebs_volume_count

  device_name = var.ec2_device_names[count.index % var.ebs_volume_count]
  volume_id   = aws_ebs_volume.k8s-worker-ebs-vol.*.id[count.index]
  instance_id = element(module.k8s-worker.*.id, floor(count.index / var.ebs_volume_count))

}


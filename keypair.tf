resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "${var.project}-${var.env}-key"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create a "dm-aws-key.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ~/${var.project}-${var.env}-key-${formatdate("DDMMYYYY", timestamp())}.pem; chmod 0400 ~/${var.project}-${var.env}-key-${formatdate("DDMMYYYY", timestamp())}.pem"
  }
}

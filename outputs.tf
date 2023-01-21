output "vpc_id" {
  description = "ID of project VPC"
  value       = module.vpc.vpc_id
}

output "master_device_name" {

  description = "Volume name of K8s Master Node"
  value       = aws_volume_attachment.k8s-master-vol-attach.*.device_name
}



variable "env" {
  type    = string
  default = "dev"
}

variable "project" {
  type    = string
  default = "dm"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    project     = "dm",
    environment = "rnd"
  }
}

variable "ami" {
  type    = string
  default = "ami-0667149a69bc2c367"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "master_instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.medium"
}

variable "worker_instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.medium"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_name" {
  type    = string
  default = "dm-vpc"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "Number of public subnets."
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets."
  type        = number
  default     = 2
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}


variable "master_instance_count" {
  type    = number
  default = 1
}

variable "worker_instance_count" {
  type    = number
  default = 1
}

variable "ebs_volume_count" {
  type    = number
  default = 0
}

variable "ec2_ebs_volume_size" {
  type = list(any)
  default = [
    10
  ]
}

variable "ec2_device_names" {
  type = list(any)
  default = [
    "/dev/sdd"
  ]
}

variable "ubuntu_ami_id" {
  description = "this is ubuntu ami id"

  # I am using amazon linux image
  default = "ami-07db477c3f5d337a5"
}

variable "centos_ami_id" {
  description = "this is ubuntu ami id"

  # I am using amazon linux image
  default = "ami-0667149a69bc2c367"
}


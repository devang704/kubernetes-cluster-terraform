# kubernetes-cluster-terraform
This project is usde to setup infrastructure using terraform to configure kubernetes cluster on ec2 instances

Below Resources will be created using terraform
1. AWS Elastic IP
2. AWS Key Pair to ssh ec2 Instances
3. AWS Private key for Password less ssh
4. Ec2 Instance as jumpHost
5. Ec2 Instance for Kubernetes controlplain node
6. Ec2 Instance for Kubernetes Worker nodes
7. AWS Custom VPC
8. AWS Security Groups (Private and Public)
9. AWS Security Group rules (Egrees and Ingrees)
10. AWS Internet Gateway
11. AWS Nat Gateway
12. AWS Route table 
13. AWS Subnet (Private and Public)
14. EBS Volume

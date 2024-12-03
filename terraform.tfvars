# for VPC
vpc_name = "smruti-vpc"
vpc_cidr = "10.0.0.0/16"
azs = ["ap-south-1a", "ap-south-1b"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets = ["10.0.4.0/24", "10.0.5.0/24"]


# for EKS
eks_cluster_name = "smruti_eks_cluster"
eks_cluster_version = "1.31"
eks_ami_type = "AL2023_x86_64_STANDARD"
eks_instance_type = ["t3a.small"]
node_capacity_type = "SPOT"
node_min_size = 1
node_max_size = 1
node_desired_size = 1
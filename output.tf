output "ecr_urls" {
  description = "ECR repository URLs for microservices"
  value       = { for ms in var.microservices : ms => module.ecr[ms].repository_url }
}


output "vpc_id" {
  description = "VPC_ID that we have created by VPC module"
  value = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private Subnets thats are created by VPC module"
  value = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public Subnets that we created from VPC modules"
  value = module.vpc.public_subnets
}
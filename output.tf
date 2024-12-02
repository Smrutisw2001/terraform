output "ecr_urls" {
  description = "ECR repository URLs for microservices"
  value       = { for ms in var.microservices : ms => module.ecr[ms].repository_url }
}

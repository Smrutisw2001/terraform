# For ECR
variable "microservices" {
  description = "ECR for different microservices"
  type = list(string)
  default = ["accountingservice", "adservice", "cartservice", "checkoutservice", "currencyservice", "emailservice", "featureflagservice", "frauddetectionservice", "frontend-app", "frontendproxy", "kafka","loadgenerator", "paymentservice","productcatalogservice","quoteservice", "recommendationservice","shippingservice"]
}


# For VPC
variable "vpc_name"{
 description = "value for vpc"
}

variable "vpc_cidr" {
  description = "value for cidr range for vpc"
}

variable "azs" {
  description = "value for availabiltiy zones"
  type = list(string)
} 

variable "private_subnets" {
  description = "value for my private_subnets"
  type = list(string)
}

variable "public_subnets" {
  description = "value for my public subnets"
  type = list(string)
}


# For EKS
variable "eks_cluster_name" {
  description = "value for eks cluster name by smruti"
}

variable "eks_cluster_version" {
  description = "value for EKS cluster version"
  type = string
}

variable "eks_ami_type" {
  description = "value for ami type for eks node by smruti"
  type = string
}

variable "eks_instance_type" {
  description = "value for instance type for eks worker node"
  type = list(string)
}

variable "node_capacity_type" {
  description = "choose node type ondemand or spot"
}

variable "node_min_size" {
  description = "value for min number of node"
}

variable "node_max_size" {
  description = "value for max number of node"
}

variable "node_desired_size" {
  description = "value for desired number of node"
}
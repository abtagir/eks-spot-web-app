variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "eu-central-1" # change if you prefer
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "eks-spot"
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.29"
}

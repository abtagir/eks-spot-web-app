module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  eks_managed_node_groups = {
    spot = {
      desired_size  = 1
      min_size      = 0
      max_size      = 3
      capacity_type = "SPOT"

      # Give the ASG options to replace interrupted capacity
      instance_types = ["t3.small", "t3a.small", "t2.small"]

      labels = {
        lifecycle = "Ec2Spot"
      }

      tags = {
        Name = "${var.cluster_name}-spot"
      }
    }
  }

  tags = {
    Project = var.cluster_name
  }
}

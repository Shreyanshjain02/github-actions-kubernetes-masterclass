module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${var.environment}-skillpulse-eks"
  kubernetes_version = "1.35" # Note: Ensure your target version matches AWS support

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets
  endpoint_public_access = true
  endpoint_private_access = true
  

  enable_cluster_creator_admin_permissions = true

  # 1. Safely handle control plane IAM lifecycle
  create_iam_role = true

  addons = {
    vpc-cni = {
      most_recent    = true
      before_compute = true # Prevents network plugin timeout
    }
    kube-proxy = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      min_size     = 1
      max_size     = 3

      instance_types = ["c7i-flex.large"]
      disk_size      = 50
     
      create_iam_role            = true
      iam_role_attach_cni_policy = true 
    }
  }
}

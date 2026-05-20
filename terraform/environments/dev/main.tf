# ---------------- VPC ----------------

module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  aws_region  = var.aws_region
}

# ---------------- ECR ----------------

module "ecr" {
  source = "../../modules/ecr"

  environment = var.environment
}

# ---------------- IAM ----------------



# ---------------- EKS ----------------

module "eks" {
  source = "../../modules/eks"

  environment = var.environment
  aws_region  = var.aws_region

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets  
  
}

# ---------------- RDS ----------------

module "rds" {
  source = "../../modules/rds"

  environment = var.environment

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

# ---------------- Monitoring ----------------

module "monitoring" {
  source = "../../modules/monitoring"

  environment = var.environment
}
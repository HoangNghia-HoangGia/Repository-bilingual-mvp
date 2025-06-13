module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.17.0"
  cluster_name    = "bilingual-eks"
  cluster_version = "1.24"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  node_groups = {
    on_demand = {
      desired_capacity = 2
      max_capacity     = 4
      instance_type    = "t3.medium"
    }
    spot = {
      desired_capacity = 0
      max_capacity     = 4
      instance_type    = "t3.medium"
      spot_price       = "0.0375"
    }
  }
  tags = var.common_tags
}

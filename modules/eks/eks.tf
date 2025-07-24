module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.env}-eks"
  cluster_version = "1.28"
  subnets         = var.subnets
  vpc_id          = var.vpc_id
  enable_irsa     = true
}
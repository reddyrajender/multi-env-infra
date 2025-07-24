provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-dev"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}

module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  env        = "dev"
}

module "eks" {
  source  = "../../modules/eks"
  env     = "dev"
  vpc_id  = module.vpc.vpc_id
  subnets = ["subnet-xyz", "subnet-abc"]
}
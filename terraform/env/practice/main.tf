provider "aws" {
  region = "ap-northeast-2"
}

module "iam" {
  source = "../../modules/iam"
}

module "s3" {
  source = "../../modules/s3"
}

module "ec2" {
  source = "../../modules/ec2"
	instance_type = var.instance_type
	instance_volume_size   = var.instance_volume_size
	sg_protocol      = var.sg_protocol
	sg_cidr_blocks   = var.sg_cidr_blocks
}

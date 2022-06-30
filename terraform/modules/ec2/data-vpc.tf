data "aws_vpc" "dvo_poc_eks_vpc" {
  filter {
    name   = "tag:Name"
    values = ["dvo-poc-vpc"]
  }
}

data "aws_subnet" "dvo_poc_private_2a" {
  filter {
    name   = "tag:Name"
    values = ["dvo-poc-private-ap-northeast-2a"]
  }
}
data "aws_subnet" "dvo_poc_private_2b" {
  filter {
    name   = "tag:Name"
    values = ["dvo-poc-private-ap-northeast-2b"]
  }
}
data "aws_subnet" "dvo_poc_private_2c" {
  filter {
    name   = "tag:Name"
    values = ["dvo-poc-private-ap-northeast-2c"]
  }
}
data "aws_subnet" "dvo_poc_public_2a" {
  filter {
    name   = "tag:Name"
    values = ["dvo-poc-public-ap-northeast-2a"]
  }
}
data "aws_subnet" "dvo_poc_public_2b" {
  filter {
    name   = "tag:Name"
    values = ["dvo-poc-public-ap-northeast-2b"]
  }
}
data "aws_subnet" "dvo_poc_public_2c" {
  filter {
    name   = "tag:Name"
    values = ["dvo-poc-public-ap-northeast-2c"]
  }
}

data "aws_ami" "dvo_ami" {
	filter {
		name   = "tag:Name"
		values = ["ohtaeg-saa-ami"]
	}

	owners = ["495523830808"]
}

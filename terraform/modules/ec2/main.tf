resource "aws_instance" "instance"{

#  for_each = toset(["one", "two", "three"])

#name = "instance-${each.key}"
  ami                    = data.aws_ami.dvo_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  subnet_id              = data.aws_subnet.dvo_poc_public_2a.id
	associate_public_ip_address = var.associate_public_ip_address
  tags = {
	  Name        = "terraform-test"
#	  Name        = "instance-${each.key}" 
    Terraform   = "true"
    Env         = "test"
		Owner       = "dongwook"
  }
	root_block_device {
		volume_size = var.instance_volume_size
		volume_type = var.instance_volume_type
		tags = {
			Name        = "terraform-test"
#			Name        = "instance-${each.key}" 
      Terraform   = "true"
			Owner       = "dongwook"
			Env         = "test"
    }  
	}
#	user_data = <<-EOF
#		            #!/bin/bash
#		            sudo apt update -y
#								EOF
}

resource "aws_security_group" "instance" {
	vpc_id = data.aws_vpc.dvo_poc_eks_vpc.id
  name = "terraform-wook-example-instance"
	description = "This security group is for test"
  ingress {
    from_port   = 80
    to_port     = 82
    protocol    = var.sg_protocol
    cidr_blocks = [var.sg_cidr_blocks]
  }
#	egress {
#		from_port   =
#		to_port     =
#		protocol    =
#		cidr_blocks =
#	}
}

resource "aws_key_pair" "terraform-key" {
  key_name = "terraform-key"
  public_key = file("~/.ssh/terraform-test.pub")
}

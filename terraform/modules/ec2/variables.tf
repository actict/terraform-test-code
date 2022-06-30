variable "instance_type" {
  type        = string
  description = "The instance type to choice for the instance"
}

variable "instance_volume_size" {
  type        = number
  description = "The volume size to choice for the instance"
}

variable "instance_volume_type" {
  type        = string
  description = "The volume type to choice for the instance"
	default     = "gp3"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  description = "Associate a public IP address with the instance."
  sensitive   = true
}

variable "sg_cidr_blocks" {
#  type        = string
#  description = "cidr to use for the security grup"
}
 
variable "sg_protocol" {
  type        = string
  description = "protocol to use for the security grup"
}

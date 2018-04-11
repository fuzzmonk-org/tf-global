### USER CREDS ###
variable "credentials" {
  default = "~/.aws/creds"
}

variable "aws_profile" {
  default = "default"
}

variable "key_name" {
  default = "aws_tmatsuo"
}

variable "region" {
  default = "us-east-1"
}

# if set, overridden in terraform.tfvars
variable "env" { default = "" }
variable "project" { default = "" }

# put in for creating tf remote state files, but not needed
variable "envs" { default = [ "dev", "stage", "prod" ] }


### NETWORK ###
variable "cidr" { default = "" }
variable "azs" {default = []}
variable "admin_net" {default = []}
variable "build_net" {default = []}
variable "public_net" {default = []}
variable "private_net" {default = []}

variable "dns_ext_zone_name" { default = "" }
variable "dns_int_zone_name" { default = "" }
variable "ttl" { default = "" }

variable bastion_ami { default = "" }

# don't need to worry about this yet
variable amis {
  description = "AMIs per region: Ubuntu 16.04 LTS hvm:ebs-ssd"
  type = "map"
  default = {
    us-east-1 = "ami-43a15f3e"
    us-east-2 = "ami-916f59f4"
    us-west-1 = "ami-925144f2"
    us-west-2 = "ami-4e79ed36"
  }
}

# for bastion module
variable "bastion_ami_owner" { default = "" }
variable "bastion_env" { default = "" }
variable "bastion_vpc_id" { default = "" }
variable "bastion_subnet" { default = "" }
variable "iam_instance_profile" { default = "" }


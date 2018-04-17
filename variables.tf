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



### ENVIRONMENT ###
# if set, overridden in terraform.tfvars
variable "env" { default = "" }
variable "project" { default = "" }
# put in for creating tf remote state files, but not needed
variable "envs" { default = [ "dev", "stage", "prod", "test" ] }



### NETWORK ###
variable "cidr" { default = "" }
variable "azs" {default = []}
variable "admin_net" {default = []}
variable "build_net" {default = []}
variable "public_net" {default = []}
variable "private_net" {default = []}
# Route53
variable "dns_ext_zone_name" { default = "" }
variable "dns_int_zone_name" { default = "" }
variable "ttl" { default = "" }



### AMI ###
# using bastion_ami_owner and most_recent=true instead of bastion_ami
variable bastion_ami { default = "" }

# for bastion module
variable "bastion_ami_owner" { default = "" }
variable "bastion_env" { default = "" }
variable "bastion_vpc_id" { default = "" }
variable "bastion_subnet" { default = "" }
variable "iam_instance_profile" { default = "" }

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


### KOPS/KUBERNETES ###
variable kubernetes_ver { default = "" }
variable kops_s3 { default = "" }
variable kops_iam { default = "" }
variable kops_name { default = "" }

variable kops_network { default = "" }
variable kops_topology { default = "" }

variable kops_vpc { default = "" }
variable kops_zones { default = [] }
variable kops_subnets { default = "" }
variable kops_utility_subnets { default = "" }

variable kops_master_size { default = "" }
variable kops_node_size { default = "" }
variable kops_node_count { default = "" }

variable kops_dns_type { default = "" }
variable kops_dns_zone { default = "" }

variable kops_api_loadbalancer_type { default = "" }






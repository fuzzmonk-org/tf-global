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


/*
# option 1
variable "admin_net" {
  default = "172.21.11.0/24,172.21.12.0/24,172.21.13.0/24"
}

variable "build_net" {
  default = "172.21.21.0/24,172.21.22.0/24,172.21.23.0/24"
}

variable "public_net" {
  default = "172.21.31.0/24,172.21.32.0/24,172.21.33.0/24"
}

variable "private_net" {
  default = "172.21.41.0/24,172.21.42.0/24,172.21.43.0/24"
}

# option 2
variable "subnets1" {
  description = "my subnets"
  type = "map"
  default = {
    admin_net = "172.21.11.0/16,172.21.12.0/16,172.21.13.0/16"
    build_net = "172.21.21.0/16,172.21.22.0/16,172.21.23.0/16"
    public_net = "172.21.31.0/16,172.21.32.0/16,172.21.33.0/16"
    private_net = "172.21.41.0/16,172.21.42.0/16,172.21.43.0/16"
  }
}

# option 3
variable "subnets2" {
  description = "subnets for a vpc"
  default = [
    {
      name = "admin_net"
      us-east-1a = "172.21.11.0/16"
      us-east-1b = "172.21.12.0/16"
      us-east-1c = "172.21.13.0/16"
    },
    {
      name = "build_net"
      us-east-1a = "172.21.21.0/16"
      us-east-1b = "172.21.22.0/16"
      us-east-1c = "172.21.23.0/16"
    },
    {
      name = "private_net"
      us-east-1a = "172.21.31.0/16"
      us-east-1b = "172.21.32.0/16"
      us-east-1c = "172.21.33.0/16"
    },
    {
      name = "public_net"
      us-east-1a = "172.21.41.0/16"
      us-east-1b = "172.21.42.0/16"
      us-east-1c = "172.21.43.0/16"
    }
  ]
}

*/



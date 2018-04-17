# terraform{} does not accept interpolation, so everything has to be hard coded
# don't forget that when you copy/paste this elsewhere!
terraform {
  required_version = ">= 0.11.0"
  backend "s3" {
    encrypt = true
    bucket = "terraform-remote-state-s3-global"
    dynamodb_table = "terraform-state-lock-dynamodb-global"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  version                 = "~> 1.12"
  region                  = "${var.region}"
  shared_credentials_file = "${var.credentials}"
  profile                 = "${var.aws_profile}"
}


# this is required before you create any vpc's
# create s3 buckets and dynamoDB tables for terraform state locking
module "terraform-global" {
  source = "../tf-modules/terraform"
  project = "global"
}

module "terraform-dev-apps" {
  source = "../tf-modules/terraform"
  project = "dev-apps"
}

module "terraform-dev-data" {
  source = "../tf-modules/terraform"
  project = "dev-data"
}

module "terraform-dev-vpc" {
  source = "../tf-modules/terraform"
  project = "dev-vpc"
}

module "terraform-test-apps" {
  source = "../tf-modules/terraform"
  project = "test-apps"
}

module "terraform-test-vpc" {
  source = "../tf-modules/terraform"
  project = "test-vpc"
}





/*

*/





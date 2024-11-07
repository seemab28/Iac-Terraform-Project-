terraform {
    required_version = "~> 1.9.6" //  Value mention as per your terraform version
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.68.0"  // Value mention as per your aws version
     }
    }
   }

provider "aws" {
	region = "us-east-1"
	
}

# Provider-2 for us-west-1
provider "aws" {
  region = "us-west-1"
  profile = "default"
  alias = "aws-west-1"
}

#How to reference the non-default provider configuration in a resource?

# Resource Block to Create VPC in us-west-1
resource "aws_vpc" "vpc-us-west-1" {
  cidr_block = "10.2.0.0/16"
  #<PROVIDER NAME>.<ALIAS>
  provider = aws.aws-west-1
  tags = {
    Name = "vpc-us-west-1"
  }
}
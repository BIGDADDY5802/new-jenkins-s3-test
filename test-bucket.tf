terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use latest version if possible
    }
  }


  backend "s3" {
    bucket = "11-9-backend"
    key    = "jenkins-test-032226/terraform.tfstate"
    region = "us-east-1"
    encrypt = true                                 # Enable server-side encryption (optional but recommended)
  }

  } 


provider "aws" {
  region  = "us-east-1"
}

resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "jenkins-bucket-3109"
  force_destroy = true
  

  tags = {
    Name = "Jenkins Bucket"
  }
}
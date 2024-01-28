# S3 remote state 
terraform {
  backend "s3" {
    bucket         = "dl-tf-remote-dev-bkt"
    key            = "project/dl/gitlab-runer"
    region         = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.12"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = ">=2.11.0"
    }
  }
}

module "dev_runner" {
    
    source   = "../../"
    gitlab_registration_token   = "%%%%%%%$$$$$$$$$"
    runner_tag                  = "dl-dev-k8s"
    runner_name                 = "dl-dev-k8s"
    gitlab_url                  = "https://gitlab.com/"


}

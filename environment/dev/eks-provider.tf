######################################################################################
#K8S and Helm Provider
######################################################################################

provider "kubernetes" {
  host                   = "https://C4546A3AD320086BB7uyt678.gr7.us-east-1.eks.amazonaws.com"
  cluster_ca_certificate = base64decode("")
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = [ "eks", "get-token", "--cluster-name", "dlframe-dev-eks", "--region",  "us-east-1" ]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = "https://C4546A3AD320086BB7uyt678.gr7.us-east-1.eks.amazonaws.com"
    cluster_ca_certificate = base64decode("")
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = [ "eks", "get-token", "--cluster-name", "dlframe-dev-eks", "--region",  "us-east-1" ]
      command     = "aws"
    }
  }
}

provider "kubectl" {
    host                   = ""
    cluster_ca_certificate = base64decode("")
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = [ "eks", "get-token", "--cluster-name", "dlframe-dev-eks", "--region",  "us-east-1" ]
      command     = "aws"
    }
}

provider "aws" {
  region = "us-east-1"
}

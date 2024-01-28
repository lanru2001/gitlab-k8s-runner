######################################################################################
#K8S and Helm Provider
######################################################################################

provider "kubernetes" {
  host                   = "https://C4546A3AD320086BBEAF69D3CBEE0CBB.gr7.us-east-1.eks.amazonaws.com"
  cluster_ca_certificate = base64decode("LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1EVXlNakV6TURneE1Gb1hEVE16TURVeE9URXpNRGd4TUZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTThLCjJ5UWZsdlAzTGpabzVQVUd2UlRXZEN3elRNeGs1NllPeHFpd1Q0NlZSeHFmYitMdExod0hNNWF3Sk1vL3JFQXIKS2ZFaTJRYWJYb1VvOWNXOG8rN1NVYzdWRm5KNDNJTnN4WkVHcEJDZ1RxK09xZ2luYTdxdkpUbVN0R2phbFIrbApNQ0lZR1BjaEp4aVBXc2lJRFRwa3FzN01nbm1TQVB3RW1LbVRlNUJjUkpCTVRBVWx0a0xTL1dBclNYQmFhZVUrCkU0U0pMUzExYW5Rd0hHSWt3UCtXWjVWMnltaU9UQ0xJQU1tZUhaUHpBY2o3MnhjeVQ0d3NyTHpDZUpNTGNEcFkKYnFaeTMyQUZxK3piYURuZUhQZnNPZzk5ajB0bW1YcnZIOG5kZXlQejFCM3EvRXp0VjU0OEMzR0xQTFFCOStmYgp3WFdqTGRCcnRBbThUdnJhR3lNQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZKckFqd21YZTBTanBUYk9PM0ptQ0JFVlhOYnFNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBSGVwWllFaDJrem1BTXRYb1pJQwpBYmExUFhPUWttNmpyT3JIQXBmTk5MYTQwYTRIdktqSzhOclZUVGFpci9JNlhTV2Z0NFRiSkNmaGNLU2ZPMWZuCmlkWW9oczZaamRXZmhGTUF2ZXVQb3NPN0VvRDQ3NklYZWlyVGUrN045Q2o4VnFKZGRpV01kWGR0WUpBbXVzc2wKMUlQNGx3N3dzQU1ZSTVLbVpSd3pBck5sMEZQKzNiTTlOaFVMSUdTTE5HeHVWdXZxZWxUVkhLVUFVV0laNWU4QwplYkplRG9Md1EwUWJaMTZtTC82MHIxdmFWbHRreEwvOTE5c0N4eDN6SnFGY2Mrc2RjWnhRWmxRRnpKc3dibjBjCmtjQlRqK0J5YXViUmJxc0tVNGVkS2pjdjYzaU1Tb1VuTVFrdi9SNjBxM3RrYXhYQ1Vaa0M5VVVHejVaQ0JaNVQKeUFVPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==")
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = [ "eks", "get-token", "--cluster-name", "dlframe-dev-eks", "--region",  "us-east-1" ]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = "https://C4546A3AD320086BBEAF69D3CBEE0CBB.gr7.us-east-1.eks.amazonaws.com"
    cluster_ca_certificate = base64decode("LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1EVXlNakV6TURneE1Gb1hEVE16TURVeE9URXpNRGd4TUZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTThLCjJ5UWZsdlAzTGpabzVQVUd2UlRXZEN3elRNeGs1NllPeHFpd1Q0NlZSeHFmYitMdExod0hNNWF3Sk1vL3JFQXIKS2ZFaTJRYWJYb1VvOWNXOG8rN1NVYzdWRm5KNDNJTnN4WkVHcEJDZ1RxK09xZ2luYTdxdkpUbVN0R2phbFIrbApNQ0lZR1BjaEp4aVBXc2lJRFRwa3FzN01nbm1TQVB3RW1LbVRlNUJjUkpCTVRBVWx0a0xTL1dBclNYQmFhZVUrCkU0U0pMUzExYW5Rd0hHSWt3UCtXWjVWMnltaU9UQ0xJQU1tZUhaUHpBY2o3MnhjeVQ0d3NyTHpDZUpNTGNEcFkKYnFaeTMyQUZxK3piYURuZUhQZnNPZzk5ajB0bW1YcnZIOG5kZXlQejFCM3EvRXp0VjU0OEMzR0xQTFFCOStmYgp3WFdqTGRCcnRBbThUdnJhR3lNQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZKckFqd21YZTBTanBUYk9PM0ptQ0JFVlhOYnFNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBSGVwWllFaDJrem1BTXRYb1pJQwpBYmExUFhPUWttNmpyT3JIQXBmTk5MYTQwYTRIdktqSzhOclZUVGFpci9JNlhTV2Z0NFRiSkNmaGNLU2ZPMWZuCmlkWW9oczZaamRXZmhGTUF2ZXVQb3NPN0VvRDQ3NklYZWlyVGUrN045Q2o4VnFKZGRpV01kWGR0WUpBbXVzc2wKMUlQNGx3N3dzQU1ZSTVLbVpSd3pBck5sMEZQKzNiTTlOaFVMSUdTTE5HeHVWdXZxZWxUVkhLVUFVV0laNWU4QwplYkplRG9Md1EwUWJaMTZtTC82MHIxdmFWbHRreEwvOTE5c0N4eDN6SnFGY2Mrc2RjWnhRWmxRRnpKc3dibjBjCmtjQlRqK0J5YXViUmJxc0tVNGVkS2pjdjYzaU1Tb1VuTVFrdi9SNjBxM3RrYXhYQ1Vaa0M5VVVHejVaQ0JaNVQKeUFVPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==")
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = [ "eks", "get-token", "--cluster-name", "dlframe-dev-eks", "--region",  "us-east-1" ]
      command     = "aws"
    }
  }
}

provider "kubectl" {
    host                   = ""
    cluster_ca_certificate = base64decode("dnRUJBTThLCjJ5UWZsdlAzTGpabzVQVUd2UlRXZEN3elRNeGs1NllPeHFpd1Q0NlZSeHFmYitMdExod0hNNWF3Sk1vL3JFQXIKS2ZFaTJRYWJYb1VvOWNXOG8rN1NVYzdWRm5KNDNJTnN4WkVHcEJDZ1RxK09xZ2luYTdxdkpUbVN0R2phbFIrbApNQ0lZR1BjaEp4aVBXc2lJRFRwa3FzN01nbm1TQVB3RW1LbVRlNUJjUkpCTVRBVWx0a0xTL1dBclNYQmFhZVUrCkU0U0pMUzExYW5Rd0hHSWt3UCtXWjVWMnltaU9UQ0xJQU1tZUhaUHpBY2o3MnhjeVQ0d3NyTHpDZUpNTGNEcFkKYnFaeTMyQUZxK3piYURuZUhQZnNPZzk5ajB0bW1YcnZIOG5kZXlQejFCM3EvRXp0VjU0OEMzR0xQTFFCOStmYgp3WFdqTGRCcnRBbThUdnJhR3lNQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZKckFqd21YZTBTanBUYk9PM0ptQ0JFVlhOYnFNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBSGVwWllFaDJrem1BTXRYb1pJQwpBYmExUFhPUWttNmpyT3JIQXBmTk5MYTQwYTRIdktqSzhOclZUVGFpci9JNlhTV2Z0NFRiSkNmaGNLU2ZPMWZuCmlkWW9oczZaamRXZmhGTUF2ZXVQb3NPN0VvRDQ3NklYZWlyVGUrN045Q2o4VnFKZGRpV01kWGR0WUpBbXVzc2wKMUlQNGx3N3dzQU1ZSTVLbVpSd3pBck5sMEZQKzNiTTlOaFVMSUdTTE5HeHVWdXZxZWxUVkhLVUFVV0laNWU4QwplYkplRG9Md1EwUWJaMTZtTC82MHIxdmFWbHRreEwvOTE5c0N4eDN6SnFGY2Mrc2RjWnhRWmxRRnpKc3dibjBjCmtjQlRqK0J5YXViUmJxc0tVNGVkS2pjdjYzaU1Tb1VuTVFrdi9SNjBxM3RrYXhYQ1Vaa0M5VVVHejVaQ0JaNVQKeUFVPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==")
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = [ "eks", "get-token", "--cluster-name", "dlframe-dev-eks", "--region",  "us-east-1" ]
      command     = "aws"
    }
}

provider "aws" {
  region = "us-east-1"
}

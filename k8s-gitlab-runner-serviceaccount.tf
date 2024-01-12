resource "kubernetes_service_account" "gitlab-runner" {
  metadata {
    name = "gitlab-runner"
  }
}

resource "kubernetes_service_account" "gitlab-runner-navfi" {
  metadata {
    name = "gitlab-runner"
    namespace = "navfi"
  }
}

resource "kubernetes_cluster_role" "gitlab-runner" {
  metadata {
    name = "gitlab-runner-clusterrole"
  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
  rule {
    non_resource_urls = ["/metrics","/apis/*"]
    verbs      = ["*"]
  }
}

resource "kubernetes_cluster_role_binding" "gitlab-runner" {
  metadata {
    name = "gitlab-runner-clusterbinding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "gitlab-runner-clusterrole"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "gitlab-runner"
  }  
  subject {
    kind      = "ServiceAccount"
    name      = "gitlab-runner"
    namespace = "navfi"
  }
}
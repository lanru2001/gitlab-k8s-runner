resource "helm_release" "gitlab_runners" {
  name = "gitlab-runner"
  namespace = "default"
  repository = "https://charts.gitlab.io"
  chart      = "gitlab-runner"
  version    = "0.60.0"
  create_namespace = false
  set {
    name = "runnerRegistrationToken"
    value = var.gitlab_registration_token
  }
  values = [
    <<-EOT
runners:
  tags: "${var.runner_tag}"
  secret: "gitlab-runner"
  privileged: true
  runUntagged: true
  namespace: "default"
  config: |
    [[runners]]
          name = "${var.runner_name}"
          url = "https://gitlab.com"
          token = "${var.gitlab_registration_token}"
          executor = "kubernetes"
          [runners.kubernetes]
            image = "lanru2001/kubectl:latest"
            pull_policy = "always"
            namespace = "default"
            privileged = true
            poll_interval = 5
            service_account = "default"
            cpus = "750m"
            memory = "256m"
            service_cpus = "1000m"
            service_memory = "512m"
            [runners.kubernetes.node_selector]
              "kubernetes.io/arch" = "amd64"      
EOT
  ]
  
  set {
    name = "gitlabUrl"
    value = var.gitlab_url
  }

  set {
    name = "resources\\.requests\\.cpu"
    value = "750m"
  }

  set {
    name = "resources\\.requests\\.memory"
    value =  "256m"
  }

  set {
    name = "concurrent"
    value = "10"
  }

  set {
    name = "unregisterRunners"
    value = "true"
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

}

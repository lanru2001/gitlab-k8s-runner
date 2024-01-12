resource "kubernetes_config_map" "gitlab-runner-config" {
  metadata {
    name = "gitlab-runner-config"
  }

  data = {
    "config.toml" = <<EOT
concurrent = 4
check_interval = 1
[[runners]]
 name = "k8-${module.vars.environ}"
 url = "https://gitlab.com"
 token = ${var.gitlab_runner_token}
 executor = "kubernetes"
 [runners.kubernetes]
   image = ""
   pull_policy = "always"
   privileged = true
   poll_interval = 5
   service_account = "gitlab-runner"
    cpus = "750m"
    memory = "256m"
    service_cpus = "1000m"
    service_memory = "512m"
     [runners.kubernetes.node_selector]
       type = "node"
    EOT
  }
}

resource "kubernetes_deployment" "gitlab-runner" {
  metadata {
    name = "gitlab-runner"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "gitlab-runner"
      }
    }

    template {
      metadata {
        labels = {
          name = "gitlab-runner"
        }
      }

      spec {
        service_account_name = "gitlab-runner"
        container {
          name  = "gitlab-runner"
          image = "gitlab/gitlab-runner:latest"
          command = ["/bin/sh", "-c"]
          args = ["cp /etc/gitlab-runner-config/* /etc/gitlab-runner/; /usr/bin/dumb-init /entrypoint run --user=gitlab-runner --working-directory=/home/gitlab-runner"]
          volume_mount {
            name = "gitlab-runner-config"
            mount_path = "/etc/gitlab-runner-config/"
          }

          resources {
            limits = {
              cpu    = "350m"
              memory = "256Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "64Mi"
            }
          }
        }

        volume {  
          name = "gitlab-runner-config"
          config_map { 
            name = "gitlab-runner-config"
          }
        }

      }
    }
  }
}

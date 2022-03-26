resource "digitalocean_kubernetes_cluster" "clusterdeteste" {
  name   = "clusterdeteste"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.7-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3
  }
}

provider "kubernetes" {

  config_path = "~/PycharmProjects/pythonProject/terraformK8S/kubeconfig.yaml"
}


resource "kubernetes_deployment" "kong" {
  metadata {
    name   = "kong"
    labels = {
      app = "kong"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "kong"
      }
    }
    template {
      metadata {
        labels = {
          app = "kong"
        }
      }
      spec {
        container {
          image = var.image
          name  = "kong"

          port {
            container_port = var.port
            name           = "kong"
          }

          env {
            name  = "KONG_MOTO"
            value = "password"
          }
          env {
            name  = "RCON_PASSWORD"
            value = "password"
          }

          env {
            name  = "RCON_ENABLED"
            value = "true"
          }
        }
      }
    }
  }
}

output "k8s_config" {
  value = "digitalocean_kubernetes_cluster.clusterdeteste.kube_config.0.raw_config"
}


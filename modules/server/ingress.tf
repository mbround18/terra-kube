resource "kubernetes_ingress" "in" {
  count      = lookup(var.config, "enable_web", false) ? 1 : 0
  depends_on = [kubernetes_secret.cert]

  metadata {
    name      = "ingress-${local.basename}"
    namespace = local.namespace
    labels = {
      app = local.app
    }
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"
    }
  }

  spec {
    dynamic "rule" {
      for_each = [for i in local.ports : {
        port = i
      }]
      content {
        host = var.config.hostname
        http {
          path {
            backend {
              service_name = kubernetes_service.http.0.metadata.0.name
              service_port = [for i in random_pet.port.* : i.id if jsonencode(i.keepers.port) == jsonencode(tostring(rule.value.port))][0]
            }

            path = "/"
          }
        }
      }
    }

    tls {
      secret_name = kubernetes_secret.cert.metadata.0.name
      hosts       = [var.config.hostname]
    }
  }
}

resource "kubernetes_service" "http" {
  count = lookup(var.config, "enable_web", false) ? 1 : 0

  metadata {
    name      = "http-service-${local.basename}"
    namespace = local.namespace
    labels = {
      app = local.app
    }
  }

  spec {
    selector = {
      app = local.app
    }
    session_affinity = "ClientIP"

    dynamic "port" {
      for_each = local.ports

      content {
        name        = [for i in random_pet.port.* : i.id if jsonencode(i.keepers.port) == jsonencode(tostring(port.value))][0]
        port        = port.value
        target_port = port.value
      }
    }

    type = "ClusterIP"
  }
}

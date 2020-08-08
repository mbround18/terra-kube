resource "kubernetes_deployment" "d" {
  depends_on = [kubernetes_namespace.n]
  metadata {
    name      = local.app
    namespace = local.namespace
    labels = {
      app = local.app
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = local.app
      }
    }

    template {
      metadata {
        namespace = local.namespace
        labels = {
          app = local.app
        }
      }

      spec {
        dynamic "container" {
          for_each = local.images
          content {
            image             = lookup(container.value, "image")
            image_pull_policy = "Always"
            name              = replace("img-${local.basename}-${lookup(container.value, "image")}", "/\\W|_|\\s/", "-")

            dynamic "port" {
              for_each = lookup(container.value, "ports", [80])
              content {
                # Check for a named port and if a string is provided it will fail. 
                container_port = lookup(local.named_ports, port.value, port.value)
              }
            }

            dynamic "env" {
              for_each = merge(local.common_env, lookup(container.value, "env", {
                KUBERNETES_IMAGE_NAME = lookup(container.value, "image")
              }))
              content {
                name  = env.key
                value = env.value
              }
            }

            dynamic "volume_mount" {
              for_each = lookup(container.value, "mounts")
              content {
                name       = local.volume_name
                mount_path = lookup(volume_mount.value, "path")
                sub_path   = lookup(volume_mount.value, "sub_path")
              }
            }
          }
        }

        volume {
          name = local.volume_name
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.pvc.metadata.0.name
          }
        }
      }
    }
  }
}

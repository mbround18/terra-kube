resource "kubernetes_persistent_volume_claim" "pvc" {
  depends_on = [kubernetes_namespace.n]

  metadata {
    name      = "pvc-${local.basename}"
    namespace = local.namespace
    labels = {
      app = local.app
    }
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "20G"
      }
    }
    storage_class_name = local.scname
  }
}

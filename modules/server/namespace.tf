resource "kubernetes_namespace" "n" {
  metadata {
    annotations = {
      name = local.namespace
    }

    labels = {
      app = local.app
    }

    name = local.namespace
  }
}

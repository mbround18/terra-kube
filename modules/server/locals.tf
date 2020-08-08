locals {
  basename  = lower("${var.name}-server")
  namespace = "ns-${local.basename}"
  app       = "app-${local.basename}"
  scname    = "longhorn"
  common_env = {
    WEB_HOSTNAME         = var.config.hostname
    KUBERNETES_NAMESPACE = local.namespace
  }
  cloudflare_zone = "boop.ninja"
  volume_name     = "${local.basename}-persistent-volume"
  images          = var.config.images

  named_ports = {
    http  = 80
    https = 443
  }


  ports = flatten(var.config.images.*.ports)

}


resource "random_pet" "port" {
  count = length(local.ports)
  keepers = {
    port = local.ports[count.index]
  }
}

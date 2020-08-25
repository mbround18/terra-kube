locals {
  # Essential values that if changes would require a reconstruction
  workspace = lower(terraform.workspace)
  basename  = lower("${var.name}-${local.workspace}-server")
  namespace = "ns-${local.basename}"
  app       = "app-${local.basename}"
  scname    = "longhorn"
  volume_name     = "${local.basename}-persistent-volume"

  # Easy peasy to change  
  common_env = {
    WEB_HOSTNAME         = var.config.hostname
    KUBERNETES_NAMESPACE = local.namespace
    KUBERNETES_WORKSPACE = local.workspace
  }

  # Shortcut variables
  images  = var.config.images
  ports   = flatten(var.config.images.*.ports)

}


# Random pet generator for port name
resource "random_pet" "port" {
  count = length(local.ports)
  keepers = {
    port = local.ports[count.index]
  }
}

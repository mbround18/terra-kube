
locals {
  websites_to_kube = var.servers.*.hostname
  server_deployments = {
    "hello-world" = element(var.servers, index(var.servers.*.hostname, "hai.${var.zone}"))
  }
}

module "server-deployment" {
  for_each = local.server_deployments
  source   = "./modules/server"
  name     = each.key
  config   = each.value
}

module "cloudflare-to-kube" {
  count    = length(local.websites_to_kube)
  source   = "./modules/cloudflare"
  zone     = var.zone
  hostname = replace(element(local.websites_to_kube, count.index), ".${var.zone}", "")
  providers = {
    cloudflare = cloudflare
  }
}

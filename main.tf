
module "server-deployment" {
  for_each = {
    "hello-world" = element(var.servers, index(var.servers.*.hostname, "hai.boop.ninja"))
  }
  source = "./modules/server"
  name   = each.key
  config = each.value
}


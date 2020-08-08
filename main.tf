locals {
  home_assistant_config = element(var.servers, index(var.servers.*.hostname, "hai.boop.ninja"))
  # element([for s in var.servers : s if lookup(s, "hostname") == "hai.boop.ninja"], 0)
}

module "home-assistant-io" {
  source = "./modules/server"
  name   = "home-assistant-io"
  config = local.home_assistant_config
}


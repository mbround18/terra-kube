#  Convert to module later
data "cloudflare_zones" "z" {
  filter {
    name   = local.cloudflare_zone
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "cf" {
  depends_on = [kubernetes_ingress.in]
  count      = lookup(var.config, "enable_web", false) ? 1 : 0
  zone_id    = lookup(data.cloudflare_zones.z.zones[0], "id")
  name       = replace(var.config.hostname, ".${local.cloudflare_zone}", "")
  value      = local.cloudflare_zone
  type       = "CNAME"
  ttl        = 1
  proxied    = true
}

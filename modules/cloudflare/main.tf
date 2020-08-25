data "cloudflare_zones" "z" {
  filter {
    name   = var.zone
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "cf" {
  zone_id = lookup(data.cloudflare_zones.z.zones[0], "id")
  name    = replace(var.hostname, ".${var.zone}", "")
  value   = var.zone
  type    = "CNAME"
  ttl     = 1
  proxied = true
}


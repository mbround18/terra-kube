data "cloudflare_zones" "z" {
  filter {
    name   = "boop.ninja"
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "cf" {
  zone_id = lookup(data.cloudflare_zones.z.zones[0], "id")
  name    = replace(var.hostname, ".boop.ninja", "")
  value   = "@"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}


provider "tls" {
  version = "2.2.0"
}
provider "kubernetes" {
}
provider "cloudflare" {
  version   = "~> 2.0"
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}
provider "random" {
  version = "2.3.0"
}

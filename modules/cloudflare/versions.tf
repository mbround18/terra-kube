terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.23.0"
    }
  }
  required_version = ">= 0.13"
}

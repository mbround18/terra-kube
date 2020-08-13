terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "1.12.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.9.0"
    }
    random = { 
      source = "hashicorp/random"
      version = "2.3.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "2.2.0"
    }
  }
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

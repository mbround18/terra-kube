terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "1.12.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.27.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "2.3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "2.2.0"
    }
  }
  required_version = ">= 0.13"
}

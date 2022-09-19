terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.21.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.1"
    }
  }
  required_version = ">= 0.13"
}

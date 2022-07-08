terraform {  
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "3.17.0"
    }
    random = { 
      source = "hashicorp/random"
      version = "2.3.1"
    }
    tls = {
      source = "hashicorp/tls"
      version = "2.2.0"
    }
  }
  required_version = ">= 0.13"
}

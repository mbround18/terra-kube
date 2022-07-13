terraform {  
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "3.19.0"
    }
    random = { 
      source = "hashicorp/random"
      version = "3.3.2"
    }
    tls = {
      source = "hashicorp/tls"
      version = "3.4.0"
    }
  }
  required_version = ">= 0.13"
}

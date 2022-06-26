terraform {  
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "1.13.4"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "3.17.0"
    }
    random = { 
      source = "hashicorp/random"
      version = "3.3.2"
    }
    tls = {
      source = "hashicorp/tls"
      version = "2.2.0"
    }
  }
  required_version = ">= 0.13"
}

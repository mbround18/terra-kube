variable "servers" {
  type        = list(any)
  description = "List of servers"
}

variable "cloudflare_email" {
  type        = string
  description = "Cloudflare email"
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare api token"
}



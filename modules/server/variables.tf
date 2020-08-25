variable name {
  type        = string
  description = "Required to auto-generate naming conventions"
}

variable config {
  type = any
  # object({
  #   hostname = any
  #   images = list(object({
  #     image  = any
  #     ports  = list(number)
  #     env    = any
  #     mounts = any
  #   }))
  #   enable_web = bool
  # })
  description = "Configuration for a server"
}

variable sanitize_regex {
  default = "/[^a-zA-Z]/"
}


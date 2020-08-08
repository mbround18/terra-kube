resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 8192
}

resource "tls_self_signed_cert" "ssc" {
  key_algorithm   = tls_private_key.pk.algorithm
  private_key_pem = tls_private_key.pk.private_key_pem

  # Certificate expires after 12 hours.
  validity_period_hours = 17520

  # Generate a new certificate if Terraform is run within three
  # hours of the certificate's expiration time.
  early_renewal_hours = 3

  # Reasonable set of uses for a server SSL certificate.
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]

  dns_names = [lookup(var.config, "hostname", "derp.boop.ninja")]

  subject {
    common_name  = lookup(var.config, "hostname", "derp.boop.ninja")
    organization = "Boop Ninja"
  }
}

resource "kubernetes_secret" "cert" {
  depends_on = [tls_self_signed_cert.ssc, tls_private_key.pk]
  metadata {
    name      = "tls-${local.basename}"
    namespace = local.namespace
    labels = {
      app = local.app
    }
  }

  data = {
    "tls.crt" = tls_self_signed_cert.ssc.cert_pem
    "tls.key" = tls_private_key.pk.private_key_pem
  }

  type = "kubernetes.io/tls"
}

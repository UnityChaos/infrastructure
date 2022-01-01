locals {
  nodes_ips       = digitalocean_droplet.node.*.ipv4_address
  nodes_names     = digitalocean_droplet.node.*.name
  created_tls_key = var.tls_public_key == "" || var.tls_private_key == ""
}

output "nodes_names" {
  value = local.nodes_names
  description = "Name(s) of of the node(s)"
}

output "nodes_ips" {
  value = local.nodes_ips
  description = "IP(s) of of the node(s)"
}

output "nodes_info" {
  value = zipmap(local.nodes_names, local.nodes_ips)
  description = "Info about the node(s)"
}

output "tls_private_key" {
  value = local.created_tls_key ? tls_private_key.tls_key.0.private_key_pem : file(var.tls_private_key)
  description = "TLS private key to use to connect to the nodes"
  sensitive = true
}

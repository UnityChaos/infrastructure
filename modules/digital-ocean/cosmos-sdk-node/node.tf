locals {
  username = "terraform"
  chain_json = jsondecode(data.http.chain_registry.body)
  daemon_name = var.daemon_name == null ? local.chain_json.daemon_name : var.daemon_name
  node_home = var.node_home == null ? local.chain_json.node_home : var.node_home
  git_repo = var.git_repo == null ? local.chain_json.codebase.git_repo : var.git_repo
  software_version = var.software_version == null ? local.chain_json.codebase.recommended_version : var.software_version
  chain_id = var.chain_id == null ? local.chain_json.chain_id : var.chain_id
  denom = var.denom == null ? local.chain_json.fees.fee_tokens[0].denom : var.denom
}

data "template_file" "node" {
  template = file("${path.module}/templates/node.yaml")

  vars = {
    ssh_authorized_key   = local.create_tls_key ? tls_private_key.tls_key.0.public_key_openssh : file(var.tls_public_key)
    username             = local.username
    chain_id             = local.chain_id
    software_version     = local.software_version
    git_repo             = local.git_repo
    daemon_name          = local.daemon_name
    node_home            = local.node_home
    moniker              = var.moniker
    denom                = local.denom
    #osmosis_genesis_file = var.osmosis_genesis_file == "" ? "" : file(var.var.osmosis_genesis_file)
  }
}

data "http" "chain_registry" {
  url = "https://raw.githubusercontent.com/cosmos/chain-registry/master/${var.chain_name}/chain.json"
}

resource "digitalocean_droplet" "node" {
  count  = var.node_count
  region = var.region
  name   = "${var.node_prefix}-node-${count.index}"
  image  = var.node_image
  size   = var.node_size
  ssh_keys = [
    digitalocean_ssh_key.node.fingerprint
  ]

  # Initialize node via cloud init
  user_data = data.template_file.node.rendered
}
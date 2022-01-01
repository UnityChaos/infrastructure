module "do-cosmos-sdk-node" {
  source = "../../modules/digital-ocean/cosmos-sdk-node"


  chain_name = "osmosis"
  
  chain_id         = "clean-testnet-X"
  software_version = "v6.0.0"

  region     = "nyc3"
  node_count = 1
  node_image = "ubuntu-20-04-x64"
  node_size  = "s-1vcpu-2gb"
}

output "nodes_info" {
  value = module.do-cosmos-sdk-node.nodes_info
}

output "nodes_private_key" {
  value     = module.do-cosmos-sdk-node.tls_private_key
  sensitive = true
}
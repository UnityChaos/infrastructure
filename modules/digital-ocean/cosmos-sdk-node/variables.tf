variable "software_version" {
  description = "Node software version to use"
  default     = null
  type        = string
}

variable "chain_name" {
  description = "Chain name, matching chain-registry"
  default     = "osmosis"
  type        = string
}

variable "chain_id" {
  description = "Chain id to setup"
  default     = null
  type        = string
}

variable "daemon_name" {
  description = "Executable name for node software"
  default = null
  type = string
}

variable "node_home" {
  description = "Disk location to store node data and configs"
  default = null
  type = string
}

variable "git_repo" {
  description = "Url of the code repository for the node software"
  default = null
  type = string
}

variable "moniker" {
  description = "Node moniker"
  default = "cosmos-sdk-node-terraform"
  type = string
}

variable "denom" {
  description = "Default denomination, for staking"
  default = null
  type = string
}

variable "region" {
  description = "Digital Ocean Region"
  default     = "nyc3"
  type        = string
}

variable "node_image" {
  description = "Droplet image name"
  default     = "ubuntu-20-04-x64"
  type        = string
}

variable "node_size" {
  description = "Droplet sizing for the node(s)"
  default     = "m6-1vcpu-2gb"
  type        = string
}

variable "node_count" {
  description = "How many nodes to deploy"
  default     = 1
  type        = number
}

variable "node_prefix" {
  description = "Node name prefix"
  default     = "terraform"
  type        = string
}

variable "tls_public_key" {
  description = "Path to public tls key - automatically generated if empty"
  default     = ""
  type        = string
}

variable "tls_private_key" {
  description = "Path to private tls key - automatically generated if empty"
  default     = ""
  type        = string
}

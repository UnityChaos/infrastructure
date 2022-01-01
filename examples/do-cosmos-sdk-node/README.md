# Setup Cosmos-SDK node on Digital Ocean

## Prerequisites

### Tools

```
terraform 1.0.11
```

### DigitalOcean API Token

Get an API token from [here](https://cloud.digitalocean.com/account/api)

```bash
export DIGITALOCEAN_TOKEN="your_personal_access_token"
```

## Deploy Cosmos-SDK node(s)

Initialize the module:

```bash
make init
```

Create the plan:

```bash
make plan
```

Apply the plan:

```bash
make apply
```

## Connect to the node

Get the information about the node(s) you created:

```bash
make output
```

Expected output:

```bash
osmosis_nodes_info = {
  "terraform-node-0" = "159.203.80.187"
}
osmosis_nodes_private_key = <sensitive>
```

Get the ssh key:

```bash
make key
```

Connect to one node using the key and the IP address:

```bash
ssh -i key terraform@159.203.80.187
```

The node is initialized via `cloud-init`, you can inspect the log with:

```bash
sudo tail -f /var/log/cloud-init-output.log
```

## Destroy osmosis node(s)

```bash
make destroy
```
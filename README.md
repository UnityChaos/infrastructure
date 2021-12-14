#Osmosis IAC
This is an experimental attempt to setup the infrastructure as code for running different osmosis setups via Terraform. Terraform is quite flexible, I'm sure this can be improved a lot. The idea is to be able to recycle nodes fast and to make sure that we are always using the exact same configuration. 
At first we will use DigitalOcean but we could make modules for different cloud providers and different types of configurations. 

### Install Terraform
Install Terraform via the commands below or get more options from the [official docs](https://learn.hashicorp.com/tutorials/terraform/install-cli).

OSX
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
Windows via [Chocolatey](https://chocolatey.org/)
``` 
choco install terraform
```

### DigitalOcean API Token
Get an API token from [here](https://cloud.digitalocean.com/account/api)
```
export DO_PAT="your_personal_access_token"
```

### Setup or use an existing private key stored
Go to your [Security](https://cloud.digitalocean.com/account/security) settings and add a new private ssh key that will be used to manage your resources.
Give it the name "terraform".


# Executing Terraform

### Plan any changes that are required for your infrastructure
`terraform plan` is the command used to see what changes you are making. 

```bash
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"

```

### Execute the current plan 
`terraform apply` is used to confirm the changes. 

```bash
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"

```

### Files

- Provider.tf
  - Defines the provider and provider's configuration
- osmo-node.tf
  - Defines a node that will be created in DigitalOcean
- setup.sh
  - Utility to help you run Terraform with different parameters
- scripts/start-node.sh
  - Bash script to setup a testnet node


@PHONY: init plan apply destroy output key

init:
	terraform init

plan:
	terraform fmt && terraform validate && terraform plan -out terraform.plan

apply:
	terraform apply terraform.plan

destroy:
	terraform destroy

output:
	terraform output

key:
	rm -f key
	terraform output --raw nodes_private_key > key
	chmod 600 key
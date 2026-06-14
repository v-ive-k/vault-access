terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

# 1. Read the secret from Vault using the cross-VPC connection
data "vault_kv_secret_v2" "demo" {
  mount = "secret"
  name  = "demo-app"
}

# 2. Output the secret to verify it works
# (Terraform marks this as sensitive so it won't leak in the UI logs)
output "retrieved_password" {
  value     = data.vault_kv_secret_v2.demo.data.db_password
  sensitive = true
}
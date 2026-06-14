terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

# Add this block to bypass child token creation
provider "vault" {
  skip_child_token = true
}

data "vault_kv_secret_v2" "demo" {
  mount = "secret"
  name  = "demo-app"
}

output "retrieved_password" {
  value     = data.vault_kv_secret_v2.demo.data.db_password
  sensitive = true
}
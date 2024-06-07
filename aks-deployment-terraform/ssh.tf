resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"
  separator = ""
}

resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]
}

resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = random_pet.ssh_key_name.id
  location  = "eastus"  #Change this 
  parent_id = "/subscriptions/0cfe2870-d256-4119-b0a3-16293ac11bdc/resourceGroups/1-5914317e-playground-sandbox" # change this
}

output "key_data" {
  value = azapi_resource_action.ssh_public_key_gen.output.publicKey
}

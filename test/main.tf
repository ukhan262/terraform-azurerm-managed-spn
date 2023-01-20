module "app-registration" {

  providers = {
    azurerm.additional_kv = azurerm.dev
  }

  source        = "../"
  override_name = "sbs-azure-poc-test"
  description   = "app registration poc"

}

output "module" {
  value     = module.app-registration
  sensitive = true
}
# provider "azuread" {
#   tenant_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# }

# provider "azurerm" {
#   features {}
# }

# provider "azurerm" {
#   alias           = "additional_kv"
#   subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#   features {}
# }

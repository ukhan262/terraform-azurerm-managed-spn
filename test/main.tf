module "app-registration" {

  providers = {
    azurerm.additional_kv = azurerm.dev
  }

  source      = "../"
  name        = "sbs-azure-poc-test"
  description = "app registration poc"

}

provider "azuread" {
  tenant_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "additional_kv"
  subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  features {}
}

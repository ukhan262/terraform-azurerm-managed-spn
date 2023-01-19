variable "override_name" {
  type        = string
  description = "Name of this service principal."
  default     = null
}

variable "days_to_expire" {
  type    = number
  default = 730
}

variable "description" {
  type        = string
  description = "Human-friendly description of this service principal."
  default     = "testspn"
}

variable "environment" {
  description = "Environment that the service principal is assigned to"
  type        = string
  default     = "poc"
}

variable "company" {
  type    = string
  default = "sbs"
}

variable "purpose" {
  type    = string
  default = "poc"
}

variable "key_vault_id" {
  type    = list(string)
  default = ["/subscriptions/cdca3002-ce07-4786-9b15-ec254d5a8789/resourceGroups/sbs-infra-ncus-azuread-rg-001/providers/Microsoft.KeyVault/vaults/sbsinfrancusadkey001"]
}

variable "additional_owner_service_principal_ids" {
  type        = list(string)
  description = "ids of the service principals to use as the owner of the service principal in addition to cpt_rbac_spn"
  default     = []
}

variable "additional_key_vault_ids" {
  type    = list(string)
  default = []
}

variable "identifier_uris" {
  type    = list(string)
  default = []
}
variable "api" {
  type    = any
  default = []
}

variable "required_resource_access" {
  description = "nested block: NestingSet, min items: 0, max items: 0"
  type = set(object(
    {
      resource_access = list(object(
        {
          id   = string
          type = string
        }
      ))
      resource_app_id = string
    }
  ))
  default = []
}

variable "single_page_application" {
  type = set(object(
    {
      redirect_uris = list(string)
    }
  ))
  default = [{
    redirect_uris = []
  }]
}

variable "public_client" {
  type = set(object(
    {
      redirect_uris = list(string)
    }
  ))
  default = [{
    redirect_uris = []
  }]
}

variable "web" {
  type = set(object(
    {
      homepage_url  = string
      logout_url    = string
      redirect_uris = list(string)
    }
  ))
  default = [{
    homepage_url  = ""
    logout_url    = ""
    redirect_uris = []
  }]
}

variable "optional_claims" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      id_token = list(object(
        {
          additional_properties = list(string)
          essential             = bool
          name                  = string
          source                = string
        }
      ))
    }
  ))
  default = []
}

variable "app_role" {
  description = "A collection of app_role blocks."
  type        = any
  default     = []
}

variable "kv_id_override" {
  type        = string
  description = "override the default key vault for service principal credentials"
  default     = null
}

variable "app_role_assignment_required" {
  type    = bool
  default = false
}
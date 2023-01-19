resource "azuread_application" "app" {
  display_name            = local.name
  owners                  = local.owner_object_ids
  prevent_duplicate_names = false
  # identifier_uris         = try(var.identifier_uris, [])

  # dynamic "api" {
  #   for_each = var.api
  #   content {
  #     mapped_claims_enabled          = try(api.value.mapped_claims_enabled, false)
  #     requested_access_token_version = try(api.value.requested_access_token_version, 1)
  #     known_client_applications      = try(api.value.known_client_applications, [])

  #     dynamic "oauth2_permission_scope" {
  #       for_each = api.value.oauth2_permission_scope
  #       content {
  #         admin_consent_description  = try(oauth2_permission_scope.value.admin_consent_description, "Allow the application to access ${local.name} on behalf of the signed-in user.")
  #         admin_consent_display_name = try(oauth2_permission_scope.value.admin_consent_display_name, "${local.name}")
  #         enabled                    = try(oauth2_permission_scope.value.enabled, true)
  #         id                         = oauth2_permission_scope.value.id
  #         type                       = try(oauth2_permission_scope.value.type, "User")
  #         user_consent_description   = try(oauth2_permission_scope.value.user_consent_description, "Allow the application to access ${local.name} on your behalf.")
  #         user_consent_display_name  = try(oauth2_permission_scope.value.user_consent_display_name, "${local.name}")
  #         value                      = try(oauth2_permission_scope.value.value, "user_impersonation")
  #       }
  #     }
  #   }
  # }

  # dynamic "app_role" {
  #   for_each = var.app_role != null ? var.app_role : []
  #   content {
  #     allowed_member_types = app_role.value.allowed_member_types
  #     description          = app_role.value.description
  #     display_name         = app_role.value.display_name
  #     enabled              = lookup(app_role.value, "enabled", true)
  #     id                   = app_role.value.id
  #     value                = lookup(app_role.value, "value", null)
  #   }
  # }

  # dynamic "required_resource_access" {
  #   for_each = var.required_resource_access
  #   content {
  #     resource_app_id = required_resource_access.value["resource_app_id"]

  #     dynamic "resource_access" {
  #       for_each = required_resource_access.value.resource_access
  #       content {
  #         id   = resource_access.value["id"]
  #         type = resource_access.value["type"]
  #       }
  #     }

  #   }
  # }

  # dynamic "optional_claims" {
  #   for_each = var.optional_claims
  #   content {
  #     dynamic "id_token" {
  #       for_each = optional_claims.value.id_token
  #       content {
  #         additional_properties = id_token.value["additional_properties"]
  #         essential             = id_token.value["essential"]
  #         name                  = id_token.value["name"]
  #         source                = id_token.value["source"]
  #       }
  #     }
  #   }
  # }

  # dynamic "single_page_application" {
  #   for_each = var.single_page_application
  #   content {
  #     redirect_uris = single_page_application.value["redirect_uris"]
  #   }
  # }

  # dynamic "public_client" {
  #   for_each = var.public_client
  #   content {
  #     redirect_uris = public_client.value["redirect_uris"]
  #   }
  # }

  # dynamic "web" {
  #   for_each = var.web
  #   content {
  #     homepage_url  = web.value["homepage_url"]
  #     logout_url    = web.value["logout_url"]
  #     redirect_uris = web.value["redirect_uris"]

  #     implicit_grant {
  #       access_token_issuance_enabled = true
  #       id_token_issuance_enabled     = true
  #     }
  #   }
  # }
}

resource "azuread_application_password" "sp-password" {
  application_object_id = azuread_application.app.object_id
  end_date              = time_rotating.time.rotation_rfc3339
}

resource "azuread_application_password" "sp-password-2" {
  application_object_id = azuread_application.app.object_id
  end_date              = timeadd(time_rotating.time.rotation_rfc3339, "10m")
}


resource "azuread_service_principal" "sp" {
  application_id               = azuread_application.app.application_id
  owners                       = local.owner_object_ids
  app_role_assignment_required = var.app_role_assignment_required
  use_existing                 = true
}

resource "time_rotating" "time" {
  # rotation_days = var.days_to_expire
  rotation_minutes = 20
}

# resource "azurerm_key_vault_secret" "sp-key-id" {
#   count        = length(var.key_vault_id)
#   name         = "${local.name}-appid"
#   value        = azuread_service_principal.sp.application_id
#   key_vault_id = var.key_vault_id[count.index]

#   lifecycle {
#     ignore_changes = [tags]
#   }
# }

# resource "azurerm_key_vault_secret" "sp-secret" {
#   count           = length(var.key_vault_id)
#   name            = "${local.name}-secret"
#   value           = azuread_application_password.sp-password.value
#   key_vault_id    = var.key_vault_id[count.index]
#   expiration_date = azuread_application_password.sp-password.end_date

#   lifecycle {
#     ignore_changes = [tags]
#   }
# }

# resource "azurerm_key_vault_secret" "additional-sp-key-id" {
#   provider     = azurerm.additional_kv
#   count        = length(var.additional_key_vault_ids)
#   name         = "${local.name}-appid"
#   value        = azuread_service_principal.sp.application_id
#   key_vault_id = var.additional_key_vault_ids[count.index]

#   lifecycle {
#     ignore_changes = [tags]
#   }
# }

# resource "azurerm_key_vault_secret" "additional-sp-secret" {
#   provider        = azurerm.additional_kv
#   count           = length(var.additional_key_vault_ids)
#   name            = "${local.name}-secret"
#   value           = azuread_application_password.sp-password.value
#   key_vault_id    = var.additional_key_vault_ids[count.index]
#   expiration_date = azuread_application_password.sp-password.end_date

#   lifecycle {
#     ignore_changes = [tags]
#   }
# }
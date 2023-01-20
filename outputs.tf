output "sp-object-id" {
  description = "Object-id of spn"
  value       = azuread_service_principal.sp.object_id
}

output "sp-application-id" {
  description = "Application-id of spn"
  value       = azuread_service_principal.sp.application_id
}

output "sp-name" {
  description = "Display name of the spn"
  value       = azuread_application.app.display_name
}


output "is_greater_than_jan" {
  value = local.is_greater_than_jan
}
output "is_less_than_july" {
  value = local.is_less_than_july
}

output "is_greater_than_apr" {
  value = local.is_greater_than_apr
}
output "is_less_than_oct" {
  value = local.is_less_than_oct
}

output "most_recent_password" {
  value     = local.secret_to_pass
  sensitive = true
}

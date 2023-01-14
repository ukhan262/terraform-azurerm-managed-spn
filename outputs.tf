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
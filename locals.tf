locals {
  name             = var.override_name != null ? var.override_name : upper("${var.company}-${var.purpose}-${var.environment}-sp")
  owner_object_ids = concat(var.additional_owner_service_principal_ids, [])
}
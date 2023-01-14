locals {
  name             = var.override_name != null ? var.override_name : upper("${var.company}-${var.purpose}-${var.environment}-sp")
  owner_object_ids = concat(var.additional_owner_service_principal_ids, ["02d4743b-223a-4721-a4d5-ee7f1398972c", "b92d7767-8380-432d-82e7-e014acde4b7f"])
}
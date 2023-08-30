<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.33.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_azurerm.additional_kv"></a> [azurerm.additional\_kv](#provider\_azurerm.additional\_kv) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | 0.9.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.first_password](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_application_password.second_password](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_service_principal.sp](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_key_vault_secret.additional-sp-key-id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.additional-sp-secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.sp-key-id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.sp-secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [time_static.now](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/static) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_key_vault_ids"></a> [additional\_key\_vault\_ids](#input\_additional\_key\_vault\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_additional_owner_service_principal_ids"></a> [additional\_owner\_service\_principal\_ids](#input\_additional\_owner\_service\_principal\_ids) | ids of the service principals to use as the owner of the service principal in addition to cpt\_rbac\_spn | `list(string)` | `[]` | no |
| <a name="input_api"></a> [api](#input\_api) | n/a | `any` | `[]` | no |
| <a name="input_app_role"></a> [app\_role](#input\_app\_role) | A collection of app\_role blocks. | `any` | `[]` | no |
| <a name="input_app_role_assignment_required"></a> [app\_role\_assignment\_required](#input\_app\_role\_assignment\_required) | n/a | `bool` | `false` | no |
| <a name="input_company"></a> [company](#input\_company) | n/a | `string` | `"sbs"` | no |
| <a name="input_days_to_expire"></a> [days\_to\_expire](#input\_days\_to\_expire) | n/a | `number` | `730` | no |
| <a name="input_description"></a> [description](#input\_description) | Human-friendly description of this service principal. | `string` | `"testspn"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment that the service principal is assigned to | `string` | `"poc"` | no |
| <a name="input_identifier_uris"></a> [identifier\_uris](#input\_identifier\_uris) | n/a | `list(string)` | `[]` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | n/a | `list(string)` | <pre>[<br>  "/subscriptions/cdca3002-ce07-4786-9b15-ec254d5a8789/resourceGroups/sbs-infra-ncus-azuread-rg-001/providers/Microsoft.KeyVault/vaults/sbsinfrancusadkey001"<br>]</pre> | no |
| <a name="input_kv_id_override"></a> [kv\_id\_override](#input\_kv\_id\_override) | override the default key vault for service principal credentials | `string` | `null` | no |
| <a name="input_optional_claims"></a> [optional\_claims](#input\_optional\_claims) | nested block: NestingList, min items: 0, max items: 1 | <pre>set(object(<br>    {<br>      id_token = list(object(<br>        {<br>          additional_properties = list(string)<br>          essential             = bool<br>          name                  = string<br>          source                = string<br>        }<br>      ))<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_override_name"></a> [override\_name](#input\_override\_name) | Name of this service principal. | `string` | `null` | no |
| <a name="input_public_client"></a> [public\_client](#input\_public\_client) | n/a | <pre>set(object(<br>    {<br>      redirect_uris = list(string)<br>    }<br>  ))</pre> | <pre>[<br>  {<br>    "redirect_uris": []<br>  }<br>]</pre> | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | n/a | `string` | `"poc"` | no |
| <a name="input_required_resource_access"></a> [required\_resource\_access](#input\_required\_resource\_access) | nested block: NestingSet, min items: 0, max items: 0 | <pre>set(object(<br>    {<br>      resource_access = list(object(<br>        {<br>          id   = string<br>          type = string<br>        }<br>      ))<br>      resource_app_id = string<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_single_page_application"></a> [single\_page\_application](#input\_single\_page\_application) | n/a | <pre>set(object(<br>    {<br>      redirect_uris = list(string)<br>    }<br>  ))</pre> | <pre>[<br>  {<br>    "redirect_uris": []<br>  }<br>]</pre> | no |
| <a name="input_web"></a> [web](#input\_web) | n/a | <pre>set(object(<br>    {<br>      homepage_url  = string<br>      logout_url    = string<br>      redirect_uris = list(string)<br>    }<br>  ))</pre> | <pre>[<br>  {<br>    "homepage_url": "",<br>    "logout_url": "",<br>    "redirect_uris": []<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_is_greater_than_apr"></a> [is\_greater\_than\_apr](#output\_is\_greater\_than\_apr) | n/a |
| <a name="output_is_greater_than_jan"></a> [is\_greater\_than\_jan](#output\_is\_greater\_than\_jan) | n/a |
| <a name="output_is_less_than_july"></a> [is\_less\_than\_july](#output\_is\_less\_than\_july) | n/a |
| <a name="output_is_less_than_oct"></a> [is\_less\_than\_oct](#output\_is\_less\_than\_oct) | n/a |
| <a name="output_most_recent_password"></a> [most\_recent\_password](#output\_most\_recent\_password) | n/a |
| <a name="output_sp-application-id"></a> [sp-application-id](#output\_sp-application-id) | Application-id of spn |
| <a name="output_sp-name"></a> [sp-name](#output\_sp-name) | Display name of the spn |
| <a name="output_sp-object-id"></a> [sp-object-id](#output\_sp-object-id) | Object-id of spn |
<!-- END_TF_DOCS -->
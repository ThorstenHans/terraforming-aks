resource "random_uuid" "ra_id" {

}
resource "azurerm_role_assignment" "acrpull" {
  name                 = random_uuid.ra_id.result
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
  scope                = module.myacr.acr_id
  role_definition_name = "AcrPull"
}

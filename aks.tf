resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-office-hours-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku_tier            = var.aks_uptime_sla_enabled ? "Paid" : "Free"

  kubernetes_version = var.aks_kubernetes_version
  dns_prefix         = "aks-${terraform.workspace}"

  default_node_pool {
    name                = var.aks_default_nodepool_name
    enable_auto_scaling = var.aks_default_nodepool_auto_scaling_enabled
    node_count          = var.aks_default_nodepool_node_count
    min_count           = var.aks_default_nodepool_auto_scaling_enabled ? var.aks_default_nodepool_min_node_count : null
    max_count           = var.aks_default_nodepool_auto_scaling_enabled ? var.aks_default_nodepool_max_node_count : null
    node_labels         = var.aks_default_nodepool_labels
    vm_size             = var.aks_default_nodepool_vm_size
    type                = var.aks_default_nodepool_type
    tags                = local.tags
  }

  node_resource_group = "${azurerm_resource_group.rg.name}-aks"

  identity {
    type                      = "UserAssigned"
    user_assigned_identity_id = azurerm_user_assigned_identity.aks.id
  }

  linux_profile {
    admin_username = var.aks_linux_profile_username
    ssh_key {
      key_data = var.aks_linux_profile_ssh_public_key
    }
  }

  addon_profile {
    kube_dashboard {
      enabled = var.aks_kubernetes_dashboard_enabled
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
    }
  }

  tags = local.tags
}

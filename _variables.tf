variable "location" {
  type    = string
  default = "germanywestcentral"
  validation {
    condition     = contains(["eastus2", "germanywestcentral", "westeurope"], var.location)
    error_message = "Please use one of the following regions (germanywestcentral|eastus2|westeurope)."
  }
  description = "Default location for all Azure resources"
}

variable "custom_tags" {
  type        = map(any)
  default     = {}
  description = "Custom Azure Tags associated with every resource"
}
variable "log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "Log Analytics Workspace SKU"
}

variable "log_analytivcs_workspace_retention_in_days" {
  type        = number
  default     = 30
  description = "Log Analytics Workspace Retention in days"
}

variable "acr_sku" {
  type        = string
  default     = "Standard"
  description = "SKU used to provision Azure Container Registry (Basic|Standard|Premium)"
}

variable "acr_admin_enabled" {
  type        = bool
  default     = false
  description = "Determines if the administrative account of ACR should be enabled (defaults to false)"
}

## AKS Variables


variable "aks_kubernetes_version" {
  type        = string
  default     = "1.19.11"
  description = "Which Kubernetes version should be used to spin up the AKS cluster"
}

variable "aks_uptime_sla_enabled" {
  type        = bool
  default     = false
  description = "Determines if AKS uptime SLA (paid) is enabled. D`efaults to true"
}

variable "aks_default_nodepool_name" {
  type        = string
  default     = "linux"
  description = "Default AKS NodePool name"
}

variable "aks_default_nodepool_auto_scaling_enabled" {
  type        = bool
  default     = false
  description = "Determine if AKS default nodepool should use autoscaling"
}

variable "aks_default_nodepool_min_node_count" {
  type        = number
  default     = 2
  description = "AKS default nodepool min node count (for autoscaling)"
}

variable "aks_default_nodepool_max_node_count" {
  type        = number
  default     = 4
  description = "AKS default nodepool min node count (for autoscaling)"
}

variable "aks_default_nodepool_node_count" {
  type        = number
  default     = 2
  description = "AKS default nodepool node count"
}

variable "aks_default_nodepool_labels" {
  type = map(string)
  default = {
    "com.thorsten-hans.purpose" = "general_compute"
  }
  description = "Labels attached to all nodes in AKS default nodepool"
}

variable "aks_default_nodepool_vm_size" {
  type        = string
  default     = "Standard_D2_v4"
  description = "Determines the Azure VM Size (template) that should be used for all nodes in this pool"
}

variable "aks_default_nodepool_mode" {
  type        = string
  default     = "User"
  description = "AKS default nodepool mode (System|User defaults to User)"
}

variable "aks_default_nodepool_type" {
  type        = string
  default     = "VirtualMachineScaleSets"
  description = "AKS default nodepool type ( AvailabilitySet|VirtualMachineScaleSets defaults to VirtualMachineScaleSets)"
}
variable "aks_kubernetes_dashboard_enabled" {
  type        = bool
  default     = false
  description = "Determines if Kubernetes Dashboard should be enabled in AKS"
}

variable "aks_linux_profile_username" {
  type        = string
  default     = "ubuntu"
  description = "Linux Profile username"
}

variable "aks_linux_profile_ssh_public_key" {
  type        = string
  description = "SSH key public key file"
  sensitive   = true
}

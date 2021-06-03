locals {
  default_tags = {
    "com.thorsten-hans.conference" : "AKS Office Hours"
    "com.thorsten-hans.retention" : "1-month"
  }

  tags = merge(local.default_tags, var.custom_tags)
}

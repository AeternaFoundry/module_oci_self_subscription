output "self_subscriptions_id" {
  description = "Map of id values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no id are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "self_subscriptions_additional_details" {
  description = "Map of additional_details values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no additional_details are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.additional_details if v.additional_details != null && length(v.additional_details) > 0 }
}
output "self_subscriptions_compartment_id" {
  description = "Map of compartment_id values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no compartment_id are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "self_subscriptions_defined_tags" {
  description = "Map of defined_tags values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no defined_tags are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "self_subscriptions_display_name" {
  description = "Map of display_name values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no display_name are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "self_subscriptions_freeform_tags" {
  description = "Map of freeform_tags values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "self_subscriptions_lifecycle_details" {
  description = "Map of lifecycle_details values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "self_subscriptions_product_id" {
  description = "Map of product_id values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no product_id are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.product_id if v.product_id != null && length(v.product_id) > 0 }
}
output "self_subscriptions_realm" {
  description = "Map of realm values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no realm are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.realm if v.realm != null && length(v.realm) > 0 }
}
output "self_subscriptions_region" {
  description = "Map of region values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no region are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.region if v.region != null && length(v.region) > 0 }
}
output "self_subscriptions_seller_id" {
  description = "Map of seller_id values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no seller_id are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.seller_id if v.seller_id != null && length(v.seller_id) > 0 }
}
output "self_subscriptions_source_type" {
  description = "Map of source_type values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no source_type are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.source_type if v.source_type != null && length(v.source_type) > 0 }
}
output "self_subscriptions_state" {
  description = "Map of state values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no state are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.state if v.state != null && length(v.state) > 0 }
}
output "self_subscriptions_subscription_details" {
  description = "Map of subscription_details values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no subscription_details are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => one(v.subscription_details) if v.subscription_details != null && length(v.subscription_details) > 0 }
}
output "self_subscriptions_system_tags" {
  description = "Map of system_tags values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no system_tags are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "self_subscriptions_tenant_id" {
  description = "Map of tenant_id values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no tenant_id are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.tenant_id if v.tenant_id != null && length(v.tenant_id) > 0 }
}
output "self_subscriptions_time_created" {
  description = "Map of time_created values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no time_created are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "self_subscriptions_time_ended" {
  description = "Map of time_ended values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no time_ended are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.time_ended if v.time_ended != null && length(v.time_ended) > 0 }
}
output "self_subscriptions_time_started" {
  description = "Map of time_started values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no time_started are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.time_started if v.time_started != null && length(v.time_started) > 0 }
}
output "self_subscriptions_time_updated" {
  description = "Map of time_updated values across all self_subscriptions, keyed the same as var.self_subscriptions except keys with no time_updated are omitted"
  value       = { for k, v in oci_self_subscription.self_subscriptions : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}


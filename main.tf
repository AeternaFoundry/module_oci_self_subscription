resource "oci_self_subscription" "self_subscriptions" {
  for_each = var.self_subscriptions

  compartment_id = each.value.compartment_id
  product_id     = each.value.product_id
  seller_id      = each.value.seller_id
  tenant_id      = each.value.tenant_id
  defined_tags   = each.value.defined_tags
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags
  realm          = each.value.realm
  region         = each.value.region
  source_type    = each.value.source_type

  subscription_details {
    amount = each.value.subscription_details.amount
    dynamic "billing_details" {
      for_each = each.value.subscription_details.billing_details
      content {
        billing_model = billing_details.value.billing_model
        has_gov_sku   = billing_details.value.has_gov_sku
        dynamic "meters" {
          for_each = billing_details.value.meters
          content {
            dynamic "extended_metadata" {
              for_each = meters.value.extended_metadata != null ? meters.value.extended_metadata : []
              content {
                key   = extended_metadata.value.key
                value = extended_metadata.value.value
              }
            }
            name            = meters.value.name
            rate_allocation = meters.value.rate_allocation
          }
        }
        metric_type      = billing_details.value.metric_type
        pricing_plan_key = billing_details.value.pricing_plan_key
        rate_allocation  = billing_details.value.rate_allocation
        sku              = billing_details.value.sku
      }
    }
    currency                 = each.value.subscription_details.currency
    is_auto_renew            = each.value.subscription_details.is_auto_renew
    partner_registration_url = each.value.subscription_details.partner_registration_url
    pricing_plan {
      billing_frequency = each.value.subscription_details.pricing_plan.billing_frequency
      dynamic "dimensions" {
        for_each = each.value.subscription_details.pricing_plan.dimensions != null ? each.value.subscription_details.pricing_plan.dimensions : []
        content {
          dimension_billing_frequency = dimensions.value.dimension_billing_frequency
          dimension_description       = dimensions.value.dimension_description
          dimension_key               = dimensions.value.dimension_key
          dimension_name              = dimensions.value.dimension_name
          included_quantity           = dimensions.value.included_quantity
          metric_type                 = dimensions.value.metric_type
          dynamic "rates" {
            for_each = dimensions.value.rates
            content {
              currency = rates.value.currency
              rate     = rates.value.rate
            }
          }
        }
      }
      plan_description = each.value.subscription_details.pricing_plan.plan_description
      plan_duration    = each.value.subscription_details.pricing_plan.plan_duration
      plan_name        = each.value.subscription_details.pricing_plan.plan_name
      plan_type        = each.value.subscription_details.pricing_plan.plan_type
      dynamic "rates" {
        for_each = each.value.subscription_details.pricing_plan.rates
        content {
          currency = rates.value.currency
          rate     = rates.value.rate
        }
      }
    }
  }

  dynamic "additional_details" {
    for_each = each.value.additional_details != null ? each.value.additional_details : []
    content {
      key   = additional_details.value.key
      value = additional_details.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


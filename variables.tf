variable "self_subscriptions" {
  description = <<EOT
Map of self_subscriptions, attributes below
Required:
    - compartment_id
    - product_id
    - seller_id
    - tenant_id
    - subscription_details (block):
        - amount (optional)
        - billing_details (required, block):
            - billing_model (required)
            - has_gov_sku (optional)
            - meters (required, block):
                - extended_metadata (optional, block):
                    - key (required)
                    - value (required)
                - name (required)
                - rate_allocation (required)
            - metric_type (required)
            - pricing_plan_key (required)
            - rate_allocation (required)
            - sku (required)
        - currency (optional)
        - is_auto_renew (optional)
        - partner_registration_url (required)
        - pricing_plan (required, block):
            - billing_frequency (required)
            - dimensions (optional, block):
                - dimension_billing_frequency (required)
                - dimension_description (required)
                - dimension_key (required)
                - dimension_name (required)
                - included_quantity (optional)
                - metric_type (required)
                - rates (required, block):
                    - currency (required)
                    - rate (required)
            - plan_description (optional)
            - plan_duration (optional)
            - plan_name (required)
            - plan_type (required)
            - rates (required, block):
                - currency (required)
                - rate (required)
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - realm
    - region
    - source_type
    - additional_details (block):
        - key (required)
        - value (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    product_id     = string
    seller_id      = string
    tenant_id      = string
    defined_tags   = optional(map(string))
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    realm          = optional(string)
    region         = optional(string)
    source_type    = optional(string)
    subscription_details = object({
      amount = optional(number)
      billing_details = list(object({
        billing_model = string
        has_gov_sku   = optional(bool)
        meters = list(object({
          extended_metadata = optional(list(object({
            key   = string
            value = string
          })))
          name            = string
          rate_allocation = number
        }))
        metric_type      = string
        pricing_plan_key = string
        rate_allocation  = number
        sku              = string
      }))
      currency                 = optional(string)
      is_auto_renew            = optional(bool)
      partner_registration_url = string
      pricing_plan = object({
        billing_frequency = string
        dimensions = optional(list(object({
          dimension_billing_frequency = string
          dimension_description       = string
          dimension_key               = string
          dimension_name              = string
          included_quantity           = optional(number)
          metric_type                 = string
          rates = list(object({
            currency = string
            rate     = number
          }))
        })))
        plan_description = optional(string)
        plan_duration    = optional(string)
        plan_name        = string
        plan_type        = string
        rates = list(object({
          currency = string
          rate     = number
        }))
      })
    })
    additional_details = optional(list(object({
      key   = string
      value = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.self_subscriptions : (
        length(v.subscription_details.billing_details) >= 1
      )
    ])
    error_message = "Each billing_details list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.self_subscriptions : (
        alltrue([for item in v.subscription_details.billing_details : (length(item.meters) >= 1)])
      )
    ])
    error_message = "Each meters list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.self_subscriptions : (
        v.subscription_details.pricing_plan.dimensions == null || alltrue([for item in v.subscription_details.pricing_plan.dimensions : (length(item.rates) >= 1)])
      )
    ])
    error_message = "Each rates list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.self_subscriptions : (
        length(v.subscription_details.pricing_plan.rates) >= 1
      )
    ])
    error_message = "Each rates list must contain at least 1 items"
  }
}


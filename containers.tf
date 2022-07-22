locals {
  containers_filter               = var.containers_filter_override != "" ? var.containers_filter_override : var.filter_str
  containers_notification_channel = var.containers_alerting_enabled ? var.notification_channel : ""
}

module "containers" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Estimated Containers Usage"
  query            = "avg(${var.containers_evaluation_period}):sum:datadog.estimated_usage.containers{${local.containers_filter}} > ${var.containers_critical}"
  alert_message    = "The Plan specified {{threshold}} Containers. The current estimate ({{value}}) exceeds the plan"
  recovery_message = "Count of Monitored Containers has recovered"

  # monitor level vars
  enabled            = var.containers_enabled
  alerting_enabled   = var.containers_alerting_enabled
  critical_threshold = var.containers_critical
  warning_threshold  = var.containers_warning
  priority           = var.containers_priority
  docs               = var.containers_docs
  note               = var.containers_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}

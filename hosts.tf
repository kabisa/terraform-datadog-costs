locals {
  hosts_filter               = var.hosts_filter_override != "" ? var.hosts_filter_override : var.filter_str
  hosts_notification_channel = var.hosts_alerting_enabled ? var.notification_channel : ""
}

module "hosts" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Estimated Hosts Usage"
  query            = "avg(${var.hosts_evaluation_period}):sum:datadog.estimated_usage.hosts{${local.hosts_filter}} > ${var.hosts_critical}"
  alert_message    = "The Plan specified {{threshold}} Hosts. The current estimate ({{value}}) exceeds the plan"
  recovery_message = "Count of Monitored Hosts has recovered"

  # monitor level vars
  enabled            = var.hosts_enabled
  alerting_enabled   = var.hosts_alerting_enabled
  critical_threshold = var.hosts_critical
  warning_threshold  = var.hosts_warning
  priority           = var.hosts_priority
  docs               = var.hosts_docs
  note               = var.hosts_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}

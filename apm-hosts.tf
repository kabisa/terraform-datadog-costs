locals {
  apm_hosts_filter = coalesce(
    var.apm_hosts_filter_override,
    var.filter_str
  )
}

module "apm_hosts" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Estimated APM Hosts Usage"
  query            = "avg(${var.apm_hosts_evaluation_period}):sum:datadog.estimated_usage.apm_hosts{${local.apm_hosts_filter}} > ${var.apm_hosts_critical}"
  alert_message    = "The Plan specified {{threshold}} APM Hosts. The current estimate ({{value}}) exceeds the plan"
  recovery_message = "Count of Monitored APM Hosts has recovered"

  # monitor level vars
  enabled            = var.apm_hosts_enabled
  alerting_enabled   = var.apm_hosts_alerting_enabled
  critical_threshold = var.apm_hosts_critical
  warning_threshold  = var.apm_hosts_warning
  priority           = var.apm_hosts_priority
  docs               = var.apm_hosts_docs
  note               = var.apm_hosts_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}

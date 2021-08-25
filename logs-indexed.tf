locals {
  logs_indexed_filter               = var.logs_indexed_filter_override != "" ? var.logs_indexed_filter_override : var.filter_str
  logs_indexed_notification_channel = var.logs_indexed_alerting_enabled ? var.notification_channel : ""
}

module "logs_indexed" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  name             = "Indexed Logs"
  query            = "sum(${var.logs_indexed_evaluation_period}):sum:datadog.logs.indexed{${local.logs_indexed_filter}}.as_count() > ${var.logs_indexed_critical}"
  alert_message    = "The amount of logs indexed ${var.logs_indexed_evaluation_period} is relatively high {{value}} and crosses threshold {{threshold}}"
  recovery_message = "Logs indexed amount has recovered below {{threshold}} ({{value}})"

  # monitor level vars
  enabled            = var.logs_indexed_enabled
  alerting_enabled   = var.logs_indexed_alerting_enabled
  critical_threshold = var.logs_indexed_critical
  warning_threshold  = var.logs_indexed_warning
  priority           = var.logs_indexed_priority
  severity           = var.logs_indexed_severity
  docs               = var.logs_indexed_docs
  note               = var.logs_indexed_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}

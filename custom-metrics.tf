locals {
  custom_metrics_filter               = var.custom_metrics_filter_override != "" ? var.custom_metrics_filter_override : var.filter_str
  custom_metrics_notification_channel = var.custom_metrics_alerting_enabled ? var.notification_channel : ""
}

module "custom_metrics" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5.1"

  name             = "Estimated Custom Metrics Usage"
  query            = "avg(${var.custom_metrics_evaluation_period}):sum:datadog.estimated_usage.metrics.custom{${local.custom_metrics_filter}} > ${var.custom_metrics_critical}"
  alert_message    = "The Plan specified {{threshold}} Custom Metrics. The current estimate ({{value}}) exceeds the plan"
  recovery_message = "Count of Monitored Custom Metrics has recovered"

  # monitor level vars
  enabled            = var.custom_metrics_enabled
  alerting_enabled   = var.custom_metrics_alerting_enabled
  critical_threshold = var.custom_metrics_critical
  warning_threshold  = var.custom_metrics_warning
  priority           = var.custom_metrics_priority
  severity           = var.custom_metrics_severity
  docs               = var.custom_metrics_docs
  note               = var.custom_metrics_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}

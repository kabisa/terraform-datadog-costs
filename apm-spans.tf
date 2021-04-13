locals {
  apm_spans_filter               = var.apm_spans_filter_override != "" ? var.apm_spans_filter_override : var.filter_str
  apm_spans_notification_channel = var.apm_spans_alerting_enabled ? var.notification_channel : ""
}

module "apm_spans" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5.1"

  name             = "Estimated APM Analyzed Spans Usage"
  query            = "sum(${var.apm_spans_evaluation_period}):sum:datadog.estimated_usage.apm.indexed_spans{${local.apm_spans_filter}}.as_count() > ${var.apm_spans_critical}"
  alert_message    = "The Plan specified {{threshold}} APM Analyzed Spans. The current estimate ({{value}}) exceeds the plan"
  recovery_message = "Analyzed APM Spans have recovered"

  # monitor level vars
  enabled            = var.apm_spans_enabled
  alerting_enabled   = var.apm_spans_alerting_enabled
  critical_threshold = var.apm_spans_critical
  warning_threshold  = var.apm_spans_warning
  priority           = var.apm_spans_priority
  severity           = var.apm_spans_severity
  docs               = var.apm_spans_docs
  note               = var.apm_spans_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}

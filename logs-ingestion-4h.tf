locals {
  logs_ingestion_4h_filter               = var.logs_ingestion_4h_filter_override != "" ? var.logs_ingestion_4h_filter_override : var.filter_str
  logs_ingestion_4h_notification_channel = var.logs_ingestion_4h_alerting_enabled ? var.notification_channel : ""
}

module "logs_ingestion_4h" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "Logs ingestion high"
  query            = "sum(${var.logs_ingestion_4h_evaluation_period}):sum:custom_datadog.estimated_usage.logs.ingested_bytes{${local.logs_ingestion_4h_filter}}.as_count() > ${var.logs_ingestion_4h_critical}"
  alert_message    = "The amount of logs ingested ${var.logs_ingestion_4h_evaluation_period} is relatively high {{value}} and crosses threshold {{threshold}}"
  recovery_message = "Logs ingestion amount has recovered below {{threshold}} ({{value}})"

  # monitor level vars
  enabled            = var.logs_ingestion_4h_enabled
  alerting_enabled   = var.logs_ingestion_4h_alerting_enabled
  critical_threshold = var.logs_ingestion_4h_critical
  warning_threshold  = var.logs_ingestion_4h_warning
  priority           = var.logs_ingestion_4h_priority
  docs               = var.logs_ingestion_4h_docs
  note               = var.logs_ingestion_4h_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}

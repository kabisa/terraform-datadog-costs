locals {
  logs_ingestion_4h_filter = var.logs_ingestion_4h_filter_override != "" ? var.logs_ingestion_4h_filter_override : var.filter_str
  logs_ingestion_4h_notification_channel = var.logs_ingestion_4h_alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "logs_ingestion_4h" {
  count = var.logs_ingestion_4h_enabled ? 1 : 0
  name  = "${var.service} - Logs ingestion high"
  type  = "metric alert"
  query = "sum(${var.logs_ingestion_4h_evaluation_period}):sum:datadog.estimated_usage.logs.ingested_bytes{${local.logs_ingestion_4h_filter}}.as_count() > ${var.logs_ingestion_4h_critical}"

  message = templatefile("${path.module}/alert.tpl", {
    alert_message        = "The amount of logs ingested ${var.logs_ingestion_4h_evaluation_period} is relatively high {{value}} and crosses threshold {{threshold}}"
    recovery_message     = "Logs ingestion amount has recovered below {{threshold}} ({{value}})"
    note                 = var.logs_ingestion_4h_note
    docs                 = var.logs_ingestion_4h_docs
    notification_channel = local.logs_ingestion_4h_notification_channel
  })

  tags = concat([
    "terraform:true",
    "env:${var.alert_env}",
    "service:${var.service}",
    "severity:${var.logs_ingestion_4h_severity}",
  ],
    var.additional_tags
  )

  require_full_window = true

  monitor_thresholds {
    critical = var.logs_ingestion_4h_critical
    warning  = var.logs_ingestion_4h_warning
  }

  locked = true
}

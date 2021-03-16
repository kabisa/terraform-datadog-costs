locals {
  logs_ingestion_filter = var.logs_ingestion_filter_override != "" ? var.logs_ingestion_filter_override : var.filter_str
  logs_ingestion_notification_channel = var.logs_ingestion_alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "logs_ingestion" {
  count = var.logs_ingestion_enabled ? 1 : 0
  name  = "${var.service} - Daily Logs Ingestion"
  type  = "metric alert"
  query = "sum(${var.logs_ingestion_evaluation_period}):sum:datadog.estimated_usage.logs.ingested_bytes{${local.logs_ingestion_filter}}.as_count() > ${var.logs_ingestion_critical}"

  message = templatefile("${path.module}/alert.tpl", {
    alert_message        = "The amount of logs ingested ${var.logs_ingestion_evaluation_period} is relatively high {{value}} and crosses threshold {{threshold}}"
    recovery_message     = "Logs ingestion amount has recovered below {{threshold}} ({{value}})"
    note                 = var.logs_ingestion_note
    docs                 = var.logs_ingestion_docs
    notification_channel = local.logs_ingestion_notification_channel
  })

  tags = concat([
    "terraform:true",
    "env:${var.alert_env}",
    "service:${var.service}",
    "severity:${var.logs_ingestion_severity}",
  ],
    var.additional_tags
  )

  require_full_window = true

  monitor_thresholds {
    critical = var.logs_ingestion_critical
    warning  = var.logs_ingestion_warning
  }

  locked = true
}

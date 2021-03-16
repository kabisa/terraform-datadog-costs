locals {
  logs_indexed_filter = var.logs_indexed_filter_override != "" ? var.logs_indexed_filter_override : var.filter_str
  logs_indexed_notification_channel = var.logs_indexed_alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "logs_indexed" {
  count = var.logs_indexed_enabled ? 1 : 0
  name  = "${var.service} - Indexed Logs"
  type  = "metric alert"
  query = "sum(${var.logs_indexed_evaluation_period}):sum:datadog.logs.indexed{${local.logs_indexed_filter}}.as_count() > ${var.logs_indexed_critical}"

  message = templatefile("${path.module}/alert.tpl", {
    alert_message        = "The amount of logs indexed ${var.logs_indexed_evaluation_period} is relatively high {{value}} and crosses threshold {{threshold}}"
    recovery_message     = "Logs indexed amount has recovered below {{threshold}} ({{value}})"
    note                 = var.logs_indexed_note
    docs                 = var.logs_indexed_docs
    notification_channel = local.logs_indexed_notification_channel
  })

  tags = concat([
    "terraform:true",
    "env:${var.alert_env}",
    "service:${var.service}",
    "severity:${var.logs_indexed_severity}",
  ],
    var.additional_tags
  )

  require_full_window = true

  monitor_thresholds {
    critical = var.logs_indexed_critical
    warning  = var.logs_indexed_warning
  }

  locked = true
}

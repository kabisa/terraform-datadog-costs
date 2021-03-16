locals {
  custom_metrics_filter = var.custom_metrics_filter_override != "" ? var.custom_metrics_filter_override : var.filter_str
  custom_metrics_notification_channel = var.custom_metrics_alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "custom_metrics" {
  count = var.custom_metrics_enabled ? 1 : 0
  name  = "${var.service} - Estimated Custom Metrics Usage"
  type  = "metric alert"
  query = "avg(${var.custom_metrics_evaluation_period}):sum:datadog.estimated_usage.metrics.custom{${local.custom_metrics_filter}} > ${var.custom_metrics_critical}"

  message = templatefile("${path.module}/alert.tpl", {
    alert_message        = "The Plan specified {{threshold}} Custom Metrics. The current estimate ({{value}}) exceeds the plan"
    recovery_message     = "Count of Monitored Custom Metrics has recovered"
    note                 = var.custom_metrics_note
    docs                 = var.custom_metrics_docs
    notification_channel = local.custom_metrics_notification_channel
  })

  tags = concat([
    "terraform:true",
    "env:${var.alert_env}",
    "service:${var.service}",
    "severity:${var.custom_metrics_severity}",
  ],
    var.additional_tags
  )

  require_full_window = true

  monitor_thresholds {
    critical = var.custom_metrics_critical
    warning  = var.custom_metrics_warning
  }

  locked = true
}

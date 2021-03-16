locals {
  containers_filter = var.containers_filter_override != "" ? var.containers_filter_override : var.filter_str
  containers_notification_channel = var.containers_alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "containers" {
  count = var.containers_enabled ? 1 : 0
  name  = "${var.service} - Estimated Containers Usage"
  type  = "metric alert"
  query = "avg(${var.containers_evaluation_period}):sum:datadog.estimated_usage.containers{${local.containers_filter}} > ${var.containers_critical}"

  message = templatefile("${path.module}/alert.tpl", {
    alert_message        = "The Plan specified {{threshold}} Containers. The current estimate ({{value}}) exceeds the plan"
    recovery_message     = "Count of Monitored Containers has recovered"
    note                 = var.containers_note
    docs                 = var.containers_docs
    notification_channel = local.containers_notification_channel
  })

  tags = concat([
    "terraform:true",
    "env:${var.alert_env}",
    "service:${var.service}",
    "severity:${var.containers_severity}",
  ],
    var.additional_tags
  )

  require_full_window = true

  monitor_thresholds {
    critical = var.containers_critical
    warning  = var.containers_warning
  }

  locked = true
}

locals {
  hosts_filter = var.hosts_filter_override != "" ? var.hosts_filter_override : var.filter_str
  hosts_notification_channel = var.hosts_alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "hosts" {
  count = var.hosts_enabled ? 1 : 0
  name  = "${var.service} - Estimated Hosts Usage"
  type  = "metric alert"
  query = "avg(${var.hosts_evaluation_period}):sum:datadog.estimated_usage.hosts{${local.hosts_filter}} > ${var.hosts_critical}"

  message = templatefile("${path.module}/alert.tpl", {
    alert_message        = "The Plan specified {{threshold}} Hosts. The current estimate ({{value}}) exceeds the plan"
    recovery_message     = "Count of Monitored Hosts has recovered"
    note                 = var.hosts_note
    docs                 = var.hosts_docs
    notification_channel = local.hosts_notification_channel
  })

  tags = concat([
    "terraform:true",
    "env:${var.alert_env}",
    "service:${var.service}",
    "severity:${var.hosts_severity}",
  ],
    var.additional_tags
  )

  require_full_window = true

  monitor_thresholds {
    critical = var.hosts_critical
    warning  = var.hosts_warning
  }

  locked = true
}

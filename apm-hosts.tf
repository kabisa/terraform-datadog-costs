locals {
  apm_hosts_filter = var.apm_hosts_filter_override != "" ? var.apm_hosts_filter_override : var.filter_str
  apm_hosts_notification_channel = var.apm_hosts_alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "apm_hosts" {
  count = var.apm_hosts_enabled ? 1 : 0
  name  = "${var.service} - Estimated APM Hosts Usage"
  type  = "metric alert"
  query = "avg(${var.apm_hosts_evaluation_period}):sum:datadog.estimated_usage.apm_hosts{${local.apm_hosts_filter}} > ${var.apm_hosts_critical}"

  message = templatefile("${path.module}/alert.tpl", {
    alert_message        = "The Plan specified {{threshold}} APM Hosts. The current estimate ({{value}}) exceeds the plan"
    recovery_message     = "Count of Monitored APM Hosts has recovered"
    note                 = var.apm_hosts_note
    docs                 = var.apm_hosts_docs
    notification_channel = local.apm_hosts_notification_channel
  })

  tags = concat([
    "terraform:true",
    "env:${var.alert_env}",
    "service:${var.service}",
    "severity:${var.apm_hosts_severity}",
  ],
    var.additional_tags
  )

  require_full_window = true

  monitor_thresholds {
    critical = var.apm_hosts_critical
    warning  = var.apm_hosts_warning
  }

  locked = true
}

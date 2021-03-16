locals {
  apm_spans_filter = var.apm_spans_filter_override != "" ? var.apm_spans_filter_override : var.filter_str
  apm_spans_notification_channel = var.apm_spans_alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "apm_spans" {
  count = var.apm_spans_enabled ? 1 : 0
  name  = "${var.service} - Estimated APM Analyzed Spans Usage"
  type  = "metric alert"
  query = "sum(${var.apm_spans_evaluation_period}):sum:datadog.estimated_usage.apm.indexed_spans{${local.apm_spans_filter}}.as_count() > ${var.apm_spans_critical}"

  message = templatefile("${path.module}/alert.tpl", {
    alert_message        = "The Plan specified {{threshold}} APM Analyzed Spans. The current estimate ({{value}}) exceeds the plan"
    recovery_message     = "Analyzed APM Spans have recovered"
    note                 = var.apm_spans_note
    docs                 = var.apm_spans_docs
    notification_channel = local.apm_spans_notification_channel
  })

  tags = concat([
    "terraform:true",
    "env:${var.alert_env}",
    "service:${var.service}",
    "severity:${var.apm_spans_severity}",
  ],
    var.additional_tags
  )

  require_full_window = true

  monitor_thresholds {
    critical = var.apm_spans_critical
    warning  = var.apm_spans_warning
  }

  locked = true
}

module "costs" {
  source = "kabisa/costs/datadog"

  notification_channel = "mail@example.com"
  env                  = "prd"
  alert_env            = "prd"

  # Example config, please adjust
  filter_str                 = "*"
  apm_hosts_critical         = 2
  apm_spans_critical         = 1000000
  apm_spans_warning          = 800000
  containers_critical        = 375
  custom_metrics_critical    = 10000
  hosts_critical             = 20
  logs_indexed_critical      = 150000
  logs_ingestion_4h_critical = 208000000
  logs_ingestion_critical    = 850000000
  logs_ingestion_warning     = 600000000
}
resource "datadog_logs_metric" "ingested_bytes" {
  name = "custom_datadog.estimated_usage.logs.ingested_bytes"

  compute {
    aggregation_type = "distribution"
    path             = "ingest_size_in_bytes"
  }

  filter {
    query = "*"
  }

  group_by {
    path     = "service"
    tag_name = "service"
  }

  group_by {
    path     = "datadog_index"
    tag_name = "datadog_index"
  }

  group_by {
    path     = "host"
    tag_name = "host"
  }
}

resource "datadog_logs_metric" "ingested_events" {
  name = "custom_datadog.estimated_usage.logs.ingested_events"

  compute {
    aggregation_type = "count"
  }

  filter {
    query = "*"
  }

  group_by {
    path     = "datadog_is_excluded"
    tag_name = "datadog_is_excluded"
  }
  group_by {
    path     = "service"
    tag_name = "service"
  }
  group_by {
    path     = "status"
    tag_name = "status"
  }
  group_by {
    path     = "datadog_index"
    tag_name = "datadog_index"
  }
  group_by {
    path     = "host"
    tag_name = "host"
  }
}
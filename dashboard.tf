resource "datadog_dashboard" "cost_dashboard" {
  layout_type = "ordered"
  title       = var.costs_dashboard_name_override == "" ? "Costs Dashboard" : var.costs_dashboard_name_override

  widget {
    alert_graph_definition {
      alert_id    = datadog_monitor.hosts[0].id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = datadog_monitor.apm_hosts[0].id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = datadog_monitor.containers[0].id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = datadog_monitor.logs_indexed[0].id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = datadog_monitor.custom_metrics[0].id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = datadog_monitor.logs_ingestion[0].id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
}

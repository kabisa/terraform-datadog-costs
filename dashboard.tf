resource "datadog_dashboard" "cost_dashboard" {
  layout_type = "ordered"
  title       = var.costs_dashboard_name_override == "" ? "Costs Dashboard" : var.costs_dashboard_name_override

  widget {
    alert_graph_definition {
      alert_id    = module.hosts.alert_id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = module.apm_hosts.alert_id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = module.containers.alert_id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = module.logs_indexed.alert_id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = module.custom_metrics.alert_id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
  widget {
    alert_graph_definition {
      alert_id    = module.logs_ingestion.alert_id
      title_align = "left"
      title_size  = "16"
      viz_type    = "timeseries"
    }
  }
}

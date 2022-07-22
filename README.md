
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Costs

This module will set up alerts to make sure you don't suddenly overspend on you datadog bill.
It will also generate a costs dashboard

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator

# Example Usage

```terraform
module "costs" {
  source = "kabisa/costs/datadog"

  notification_channel = "@mail@example.com"
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

```


[Module Variables](#module-variables)

Monitors:

| Monitor name    | Default enabled | Priority | Query                  |
|-----------------|------|----|------------------------|
| [Apm Hosts](#apm-hosts) | True | 4  | `avg(last_1h):sum:datadog.estimated_usage.apm_hosts{tag:xxx} > ` |
| [Apm Spans](#apm-spans) | True | 3  | `sum(last_1h):sum:datadog.estimated_usage.apm.indexed_spans{tag:xxx}.as_count() > ` |
| [Containers](#containers) | True | 4  | `avg(last_1h):sum:datadog.estimated_usage.containers{tag:xxx} > ` |
| [Custom Metrics](#custom-metrics) | True | 4  | `avg(last_1h):sum:datadog.estimated_usage.metrics.custom{tag:xxx} > ` |
| [Hosts](#hosts) | True | 4  | `avg(last_1h):sum:datadog.estimated_usage.hosts{tag:xxx} > ` |
| [Logs Indexed](#logs-indexed) | True | 3  | `sum(last_4h):sum:custom_datadog.estimated_usage.logs.ingested_events{tag:xxx}.as_count() > ` |
| [Logs Ingestion 4h](#logs-ingestion-4h) | True | 3  | `sum(last_4h):sum:custom_datadog.estimated_usage.logs.ingested_bytes{tag:xxx}.as_count() > ` |
| [Logs Ingestion](#logs-ingestion) | True | 3  | `sum(last_1d):sum:custom_datadog.estimated_usage.logs.ingested_bytes{tag:xxx}.as_count() > ` |

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Apm Hosts

Query:
```terraform
avg(last_1h):sum:datadog.estimated_usage.apm_hosts{tag:xxx} > 
```

| variable                    | default  | required | description                      |
|-----------------------------|----------|----------|----------------------------------|
| apm_hosts_enabled           | True     | No       |                                  |
| apm_hosts_warning           | None     | No       |                                  |
| apm_hosts_critical          |          | Yes      |                                  |
| apm_hosts_evaluation_period | last_1h  | No       |                                  |
| apm_hosts_note              | ""       | No       |                                  |
| apm_hosts_docs              | ""       | No       |                                  |
| apm_hosts_filter_override   | ""       | No       |                                  |
| apm_hosts_alerting_enabled  | True     | No       |                                  |
| apm_hosts_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Apm Spans

Query:
```terraform
sum(last_1h):sum:datadog.estimated_usage.apm.indexed_spans{tag:xxx}.as_count() > 
```

| variable                    | default  | required | description                      |
|-----------------------------|----------|----------|----------------------------------|
| apm_spans_enabled           | True     | No       |                                  |
| apm_spans_warning           |          | Yes      |                                  |
| apm_spans_critical          |          | Yes      |                                  |
| apm_spans_evaluation_period | last_1h  | No       |                                  |
| apm_spans_note              | ""       | No       |                                  |
| apm_spans_docs              | ""       | No       |                                  |
| apm_spans_filter_override   | ""       | No       |                                  |
| apm_spans_alerting_enabled  | True     | No       |                                  |
| apm_spans_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Containers

Query:
```terraform
avg(last_1h):sum:datadog.estimated_usage.containers{tag:xxx} > 
```

| variable                     | default  | required | description                      |
|------------------------------|----------|----------|----------------------------------|
| containers_enabled           | True     | No       |                                  |
| containers_warning           | None     | No       |                                  |
| containers_critical          |          | Yes      |                                  |
| containers_evaluation_period | last_1h  | No       |                                  |
| containers_note              | ""       | No       |                                  |
| containers_docs              | ""       | No       |                                  |
| containers_filter_override   | ""       | No       |                                  |
| containers_alerting_enabled  | True     | No       |                                  |
| containers_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Custom Metrics

Query:
```terraform
avg(last_1h):sum:datadog.estimated_usage.metrics.custom{tag:xxx} > 
```

| variable                         | default  | required | description                      |
|----------------------------------|----------|----------|----------------------------------|
| custom_metrics_enabled           | True     | No       |                                  |
| custom_metrics_warning           | None     | No       |                                  |
| custom_metrics_critical          |          | Yes      |                                  |
| custom_metrics_evaluation_period | last_1h  | No       |                                  |
| custom_metrics_note              | ""       | No       |                                  |
| custom_metrics_docs              | ""       | No       |                                  |
| custom_metrics_filter_override   | ""       | No       |                                  |
| custom_metrics_alerting_enabled  | True     | No       |                                  |
| custom_metrics_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Hosts

Query:
```terraform
avg(last_1h):sum:datadog.estimated_usage.hosts{tag:xxx} > 
```

| variable                | default  | required | description                      |
|-------------------------|----------|----------|----------------------------------|
| hosts_enabled           | True     | No       |                                  |
| hosts_warning           | None     | No       |                                  |
| hosts_critical          |          | Yes      |                                  |
| hosts_evaluation_period | last_1h  | No       |                                  |
| hosts_note              | ""       | No       |                                  |
| hosts_docs              | ""       | No       |                                  |
| hosts_filter_override   | ""       | No       |                                  |
| hosts_alerting_enabled  | True     | No       |                                  |
| hosts_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Logs Indexed

Query:
```terraform
sum(last_4h):sum:custom_datadog.estimated_usage.logs.ingested_events{tag:xxx}.as_count() > 
```

| variable                       | default  | required | description                      |
|--------------------------------|----------|----------|----------------------------------|
| logs_indexed_enabled           | True     | No       |                                  |
| logs_indexed_warning           | None     | No       |                                  |
| logs_indexed_critical          |          | Yes      |                                  |
| logs_indexed_evaluation_period | last_4h  | No       |                                  |
| logs_indexed_note              | ""       | No       |                                  |
| logs_indexed_docs              | ""       | No       |                                  |
| logs_indexed_filter_override   | ""       | No       |                                  |
| logs_indexed_alerting_enabled  | True     | No       |                                  |
| logs_indexed_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Logs Ingestion 4h

Query:
```terraform
sum(last_4h):sum:custom_datadog.estimated_usage.logs.ingested_bytes{tag:xxx}.as_count() > 
```

| variable                            | default  | required | description                      |
|-------------------------------------|----------|----------|----------------------------------|
| logs_ingestion_4h_enabled           | True     | No       |                                  |
| logs_ingestion_4h_warning           | None     | No       |                                  |
| logs_ingestion_4h_critical          | None     | No       |                                  |
| logs_ingestion_4h_evaluation_period | last_4h  | No       |                                  |
| logs_ingestion_4h_note              | ""       | No       |                                  |
| logs_ingestion_4h_docs              | ""       | No       |                                  |
| logs_ingestion_4h_filter_override   | ""       | No       |                                  |
| logs_ingestion_4h_alerting_enabled  | True     | No       |                                  |
| logs_ingestion_4h_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Logs Ingestion

Query:
```terraform
sum(last_1d):sum:custom_datadog.estimated_usage.logs.ingested_bytes{tag:xxx}.as_count() > 
```

| variable                         | default  | required | description                      |
|----------------------------------|----------|----------|----------------------------------|
| logs_ingestion_enabled           | True     | No       |                                  |
| logs_ingestion_warning           |          | Yes      |                                  |
| logs_ingestion_critical          |          | Yes      |                                  |
| logs_ingestion_evaluation_period | last_1d  | No       |                                  |
| logs_ingestion_note              | ""       | No       |                                  |
| logs_ingestion_docs              | ""       | No       |                                  |
| logs_ingestion_filter_override   | ""       | No       |                                  |
| logs_ingestion_alerting_enabled  | True     | No       |                                  |
| logs_ingestion_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable                      | default  | required | description  |
|-------------------------------|----------|----------|--------------|
| env                           |          | Yes      |              |
| service                       | Costs    | No       |              |
| notification_channel          |          | Yes      |              |
| additional_tags               | []       | No       |              |
| filter_str                    |          | Yes      |              |
| costs_dashboard_name_override | ""       | No       |              |
| locked                        | True     | No       |              |



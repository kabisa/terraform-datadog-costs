
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit)

# Terraform module for Datadog Costs

Monitors:
* [Terraform module for Datadog Costs](#terraform-module-for-datadog-costs)
  * [Containers](#containers)
  * [Apm Hosts](#apm-hosts)
  * [Hosts](#hosts)
  * [Custom Metrics](#custom-metrics)
  * [Apm Spans](#apm-spans)
  * [Logs Ingestion 4h](#logs-ingestion-4h)
  * [Logs Ingestion](#logs-ingestion)
  * [Logs Indexed](#logs-indexed)
  * [Module Variables](#module-variables)

# Getting started
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you cloud a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Containers

Query:
```terraform
avg(${var.containers_evaluation_period}):sum:datadog.estimated_usage.containers{${local.containers_filter}} > ${var.containers_critical}
```

| variable                     | default  | required | description                      |
|------------------------------|----------|----------|----------------------------------|
| containers_enabled           | True     | No       |                                  |
| containers_warning           | null     | No       |                                  |
| containers_critical          |          | Yes      |                                  |
| containers_evaluation_period | last_1h  | No       |                                  |
| containers_note              | ""       | No       |                                  |
| containers_docs              | ""       | No       |                                  |
| containers_filter_override   | ""       | No       |                                  |
| containers_alerting_enabled  | True     | No       |                                  |
| containers_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Apm Hosts

Query:
```terraform
avg(${var.apm_hosts_evaluation_period}):sum:datadog.estimated_usage.apm_hosts{${local.apm_hosts_filter}} > ${var.apm_hosts_critical}
```

| variable                    | default  | required | description                      |
|-----------------------------|----------|----------|----------------------------------|
| apm_hosts_enabled           | True     | No       |                                  |
| apm_hosts_warning           | null     | No       |                                  |
| apm_hosts_critical          |          | Yes      |                                  |
| apm_hosts_evaluation_period | last_1h  | No       |                                  |
| apm_hosts_note              | ""       | No       |                                  |
| apm_hosts_docs              | ""       | No       |                                  |
| apm_hosts_filter_override   | ""       | No       |                                  |
| apm_hosts_alerting_enabled  | True     | No       |                                  |
| apm_hosts_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Hosts

Query:
```terraform
avg(${var.hosts_evaluation_period}):sum:datadog.estimated_usage.hosts{${local.hosts_filter}} > ${var.hosts_critical}
```

| variable                | default  | required | description                      |
|-------------------------|----------|----------|----------------------------------|
| hosts_enabled           | True     | No       |                                  |
| hosts_warning           | null     | No       |                                  |
| hosts_critical          |          | Yes      |                                  |
| hosts_evaluation_period | last_1h  | No       |                                  |
| hosts_note              | ""       | No       |                                  |
| hosts_docs              | ""       | No       |                                  |
| hosts_filter_override   | ""       | No       |                                  |
| hosts_alerting_enabled  | True     | No       |                                  |
| hosts_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Custom Metrics

Query:
```terraform
avg(${var.custom_metrics_evaluation_period}):sum:datadog.estimated_usage.metrics.custom{${local.custom_metrics_filter}} > ${var.custom_metrics_critical}
```

| variable                         | default  | required | description                      |
|----------------------------------|----------|----------|----------------------------------|
| custom_metrics_enabled           | True     | No       |                                  |
| custom_metrics_warning           | null     | No       |                                  |
| custom_metrics_critical          |          | Yes      |                                  |
| custom_metrics_evaluation_period | last_1h  | No       |                                  |
| custom_metrics_note              | ""       | No       |                                  |
| custom_metrics_docs              | ""       | No       |                                  |
| custom_metrics_filter_override   | ""       | No       |                                  |
| custom_metrics_alerting_enabled  | True     | No       |                                  |
| custom_metrics_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Apm Spans

Query:
```terraform
sum(${var.apm_spans_evaluation_period}):sum:datadog.estimated_usage.apm.indexed_spans{${local.apm_spans_filter}}.as_count() > ${var.apm_spans_critical}
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


## Logs Ingestion 4h

Query:
```terraform
sum(${var.logs_ingestion_4h_evaluation_period}):sum:datadog.estimated_usage.logs.ingested_bytes{${local.logs_ingestion_4h_filter}}.as_count() > ${var.logs_ingestion_4h_critical}
```

| variable                            | default  | required | description                      |
|-------------------------------------|----------|----------|----------------------------------|
| logs_ingestion_4h_enabled           | True     | No       |                                  |
| logs_ingestion_4h_warning           | null     | No       |                                  |
| logs_ingestion_4h_critical          | null     | No       |                                  |
| logs_ingestion_4h_evaluation_period | last_4h  | No       |                                  |
| logs_ingestion_4h_note              | ""       | No       |                                  |
| logs_ingestion_4h_docs              | ""       | No       |                                  |
| logs_ingestion_4h_filter_override   | ""       | No       |                                  |
| logs_ingestion_4h_alerting_enabled  | True     | No       |                                  |
| logs_ingestion_4h_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Logs Ingestion

Query:
```terraform
sum(${var.logs_ingestion_evaluation_period}):sum:datadog.estimated_usage.logs.ingested_bytes{${local.logs_ingestion_filter}}.as_count() > ${var.logs_ingestion_critical}
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


## Logs Indexed

Query:
```terraform
sum(${var.logs_indexed_evaluation_period}):sum:datadog.logs.indexed{${local.logs_indexed_filter}}.as_count() > ${var.logs_indexed_critical}
```

| variable                       | default  | required | description                      |
|--------------------------------|----------|----------|----------------------------------|
| logs_indexed_enabled           | True     | No       |                                  |
| logs_indexed_warning           | null     | No       |                                  |
| logs_indexed_critical          |          | Yes      |                                  |
| logs_indexed_evaluation_period | last_4h  | No       |                                  |
| logs_indexed_note              | ""       | No       |                                  |
| logs_indexed_docs              | ""       | No       |                                  |
| logs_indexed_filter_override   | ""       | No       |                                  |
| logs_indexed_alerting_enabled  | True     | No       |                                  |
| logs_indexed_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable                      | default  | required | description  |
|-------------------------------|----------|----------|--------------|
| env                           |          | Yes      |              |
| alert_env                     |          | Yes      |              |
| service                       | Costs    | No       |              |
| notification_channel          |          | Yes      |              |
| additional_tags               | []       | No       |              |
| filter_str                    |          | Yes      |              |
| costs_dashboard_name_override | ""       | No       |              |
| locked                        | True     | No       |              |




[//]: # (This file is generated. Do not edit)

# costs

TOC:
<!--ts-->
   * [costs](#costs)
      * [Containers](#containers)
      * [Apm Hosts](#apm-hosts)
      * [Hosts](#hosts)
      * [Custom Metrics](#custom-metrics)
      * [Apm Spans](#apm-spans)
      * [Logs Ingestion 4h](#logs-ingestion-4h)
      * [Logs Ingestion](#logs-ingestion)
      * [Logs Indexed](#logs-indexed)
      * [Module Variables](#module-variables)

<!-- Added by: sjuuljanssen, at: za 13 mrt 2021 15:51:19 CET -->

<!--te-->

## Containers

| variable                     | default  | required | description  |
|------------------------------|----------|----------|--------------|
| containers_enabled           | True     | No       |              |
| containers_warning           | null     | No       |              |
| containers_critical          |          | Yes      |              |
| containers_evaluation_period | last_1h  | No       |              |
| containers_severity          | minor    | No       |              |
| containers_note              | ""       | No       |              |
| containers_docs              | ""       | No       |              |
| containers_filter_override   | ""       | No       |              |
| containers_alerting_enabled  | True     | No       |              |


## Apm Hosts

| variable                    | default  | required | description  |
|-----------------------------|----------|----------|--------------|
| apm_hosts_enabled           | True     | No       |              |
| apm_hosts_warning           | null     | No       |              |
| apm_hosts_critical          |          | Yes      |              |
| apm_hosts_evaluation_period | last_1h  | No       |              |
| apm_hosts_severity          | minor    | No       |              |
| apm_hosts_note              | ""       | No       |              |
| apm_hosts_docs              | ""       | No       |              |
| apm_hosts_filter_override   | ""       | No       |              |
| apm_hosts_alerting_enabled  | True     | No       |              |


## Hosts

| variable                | default  | required | description  |
|-------------------------|----------|----------|--------------|
| hosts_enabled           | True     | No       |              |
| hosts_warning           | null     | No       |              |
| hosts_critical          |          | Yes      |              |
| hosts_evaluation_period | last_1h  | No       |              |
| hosts_severity          | minor    | No       |              |
| hosts_note              | ""       | No       |              |
| hosts_docs              | ""       | No       |              |
| hosts_filter_override   | ""       | No       |              |
| hosts_alerting_enabled  | True     | No       |              |


## Custom Metrics

| variable                         | default  | required | description  |
|----------------------------------|----------|----------|--------------|
| custom_metrics_enabled           | True     | No       |              |
| custom_metrics_warning           | null     | No       |              |
| custom_metrics_critical          |          | Yes      |              |
| custom_metrics_evaluation_period | last_1h  | No       |              |
| custom_metrics_severity          | minor    | No       |              |
| custom_metrics_note              | ""       | No       |              |
| custom_metrics_docs              | ""       | No       |              |
| custom_metrics_filter_override   | ""       | No       |              |
| custom_metrics_alerting_enabled  | True     | No       |              |


## Apm Spans

| variable                    | default  | required | description  |
|-----------------------------|----------|----------|--------------|
| apm_spans_enabled           | True     | No       |              |
| apm_spans_warning           |          | Yes      |              |
| apm_spans_critical          |          | Yes      |              |
| apm_spans_evaluation_period | last_1h  | No       |              |
| apm_spans_severity          | minor    | No       |              |
| apm_spans_note              | ""       | No       |              |
| apm_spans_docs              | ""       | No       |              |
| apm_spans_filter_override   | ""       | No       |              |
| apm_spans_alerting_enabled  | True     | No       |              |


## Logs Ingestion 4h

| variable                            | default  | required | description  |
|-------------------------------------|----------|----------|--------------|
| logs_ingestion_4h_enabled           | True     | No       |              |
| logs_ingestion_4h_warning           | null     | No       |              |
| logs_ingestion_4h_critical          | null     | No       |              |
| logs_ingestion_4h_evaluation_period | last_4h  | No       |              |
| logs_ingestion_4h_severity          | minor    | No       |              |
| logs_ingestion_4h_note              | ""       | No       |              |
| logs_ingestion_4h_docs              | ""       | No       |              |
| logs_ingestion_4h_filter_override   | ""       | No       |              |
| logs_ingestion_4h_alerting_enabled  | True     | No       |              |


## Logs Ingestion

| variable                         | default  | required | description  |
|----------------------------------|----------|----------|--------------|
| logs_ingestion_enabled           | True     | No       |              |
| logs_ingestion_warning           |          | Yes      |              |
| logs_ingestion_critical          |          | Yes      |              |
| logs_ingestion_evaluation_period | last_1d  | No       |              |
| logs_ingestion_severity          | minor    | No       |              |
| logs_ingestion_note              | ""       | No       |              |
| logs_ingestion_docs              | ""       | No       |              |
| logs_ingestion_filter_override   | ""       | No       |              |
| logs_ingestion_alerting_enabled  | True     | No       |              |


## Logs Indexed

| variable                       | default  | required | description  |
|--------------------------------|----------|----------|--------------|
| logs_indexed_enabled           | True     | No       |              |
| logs_indexed_warning           | null     | No       |              |
| logs_indexed_critical          |          | Yes      |              |
| logs_indexed_evaluation_period | last_4h  | No       |              |
| logs_indexed_severity          | minor    | No       |              |
| logs_indexed_note              | ""       | No       |              |
| logs_indexed_docs              | ""       | No       |              |
| logs_indexed_filter_override   | ""       | No       |              |
| logs_indexed_alerting_enabled  | True     | No       |              |


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



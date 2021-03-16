variable "custom_metrics_enabled" {
  type    = bool
  default = true
}

variable "custom_metrics_warning" {
  type    = number
  default = null
}

variable "custom_metrics_critical" {
  type    = number
}

variable "custom_metrics_evaluation_period" {
  type    = string
  default = "last_1h"
}

variable "custom_metrics_severity" {
  type    = string
  default = "minor"
}

variable "custom_metrics_note" {
  type    = string
  default = ""
}

variable "custom_metrics_docs" {
  type    = string
  default = ""
}

variable "custom_metrics_filter_override" {
  type    = string
  default = ""
}

variable "custom_metrics_alerting_enabled" {
  type    = bool
  default = true
}

variable "apm_spans_enabled" {
  type    = bool
  default = true
}

variable "apm_spans_warning" {
  type = number
}

variable "apm_spans_critical" {
  type = number
}

variable "apm_spans_evaluation_period" {
  type    = string
  default = "last_1h"
}

variable "apm_spans_note" {
  type    = string
  default = ""
}

variable "apm_spans_docs" {
  type    = string
  default = ""
}

variable "apm_spans_filter_override" {
  type    = string
  default = ""
}

variable "apm_spans_alerting_enabled" {
  type    = bool
  default = true
}

variable "apm_spans_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

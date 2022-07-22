variable "logs_indexed_enabled" {
  type    = bool
  default = true
}

variable "logs_indexed_warning" {
  type    = number
  default = null
}

variable "logs_indexed_critical" {
  type = number
}

variable "logs_indexed_evaluation_period" {
  type    = string
  default = "last_4h"
}

variable "logs_indexed_note" {
  type    = string
  default = ""
}

variable "logs_indexed_docs" {
  type    = string
  default = ""
}

variable "logs_indexed_filter_override" {
  type    = string
  default = ""
}

variable "logs_indexed_alerting_enabled" {
  type    = bool
  default = true
}

variable "logs_indexed_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

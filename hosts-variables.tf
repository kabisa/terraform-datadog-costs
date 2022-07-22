variable "hosts_enabled" {
  type    = bool
  default = true
}

variable "hosts_warning" {
  type    = number
  default = null
}

variable "hosts_critical" {
  type = number
}

variable "hosts_evaluation_period" {
  type    = string
  default = "last_1h"
}

variable "hosts_note" {
  type    = string
  default = ""
}

variable "hosts_docs" {
  type    = string
  default = ""
}

variable "hosts_filter_override" {
  type    = string
  default = ""
}

variable "hosts_alerting_enabled" {
  type    = bool
  default = true
}

variable "hosts_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 4
}

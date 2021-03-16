variable "hosts_enabled" {
  type    = bool
  default = true
}

variable "hosts_warning" {
  type    = number
  default = null
}

variable "hosts_critical" {
  type    = number
}

variable "hosts_evaluation_period" {
  type    = string
  default = "last_1h"
}

variable "hosts_severity" {
  type    = string
  default = "minor"
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

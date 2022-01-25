variable "apm_hosts_enabled" {
  type    = bool
  default = true
}

variable "apm_hosts_warning" {
  type    = number
  default = null
}

variable "apm_hosts_critical" {
  type = number
}

variable "apm_hosts_evaluation_period" {
  type    = string
  default = "last_1h"
}

variable "apm_hosts_note" {
  type    = string
  default = ""
}

variable "apm_hosts_docs" {
  type    = string
  default = ""
}

variable "apm_hosts_filter_override" {
  type    = string
  default = ""
}

variable "apm_hosts_alerting_enabled" {
  type    = bool
  default = true
}

variable "apm_hosts_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 4
}
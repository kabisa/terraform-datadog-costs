variable "containers_enabled" {
  type    = bool
  default = true
}

variable "containers_warning" {
  type    = number
  default = null
}

variable "containers_critical" {
  type = number
}

variable "containers_evaluation_period" {
  type    = string
  default = "last_1h"
}

variable "containers_severity" {
  type    = string
  default = "minor"
}

variable "containers_note" {
  type    = string
  default = ""
}

variable "containers_docs" {
  type    = string
  default = ""
}

variable "containers_filter_override" {
  type    = string
  default = ""
}

variable "containers_alerting_enabled" {
  type    = bool
  default = true
}

variable "containers_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}
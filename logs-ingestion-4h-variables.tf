variable "logs_ingestion_4h_enabled" {
  type    = bool
  default = true
}

variable "logs_ingestion_4h_warning" {
  type    = number
  default = null
}

variable "logs_ingestion_4h_critical" {
  type    = number
  default = null
}

variable "logs_ingestion_4h_evaluation_period" {
  type    = string
  default = "last_4h"
}

variable "logs_ingestion_4h_severity" {
  type    = string
  default = "minor"
}

variable "logs_ingestion_4h_note" {
  type    = string
  default = ""
}

variable "logs_ingestion_4h_docs" {
  type    = string
  default = ""
}

variable "logs_ingestion_4h_filter_override" {
  type    = string
  default = ""
}

variable "logs_ingestion_4h_alerting_enabled" {
  type    = bool
  default = true
}

variable "logs_ingestion_enabled" {
  type    = bool
  default = true
}

variable "logs_ingestion_warning" {
  type    = number
}

variable "logs_ingestion_critical" {
  type    = number
}

variable "logs_ingestion_evaluation_period" {
  type    = string
  default = "last_1d"
}

variable "logs_ingestion_severity" {
  type    = string
  default = "minor"
}

variable "logs_ingestion_note" {
  type    = string
  default = ""
}

variable "logs_ingestion_docs" {
  type    = string
  default = ""
}

variable "logs_ingestion_filter_override" {
  type    = string
  default = ""
}

variable "logs_ingestion_alerting_enabled" {
  type    = bool
  default = true
}

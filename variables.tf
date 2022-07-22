variable "env" {
  type = string
}

variable "service" {
  type    = string
  default = "Costs"
}

variable "notification_channel" {
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "filter_str" {
  type = string
}

variable "costs_dashboard_name_override" {
  type    = string
  default = ""
}

variable "locked" {
  type    = bool
  default = true
}

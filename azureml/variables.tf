variable "name" {
  type        = string
  description = "Name of the deployment"
  default = "mlworkspace"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Location of the resources"
  default     = "East US"
}
variable "name" {
  type        = string
  description = "Name of the deployment"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "resource_group_name" {
  type    = string
}

variable "location" {
  type        = string
  description = "Location of the resources"
}

variable "prefix" {
  type = string
}
variable "location" {
  description = "The Azure Region in which the resources should exist"
  type        = string
  default     = "East US"
}

variable "prefix" {
  description = "The Prefix used for all resources in this setup"
  type        = string
  default     = "LevelOne"
}


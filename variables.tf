variable "prefix" {
  description = "A unique prefix for all resource names to avoid naming conflicts."
  type        = string
  default     = "weather-app"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "Israel Central"
}

variable "postgres_admin_login" {
  description = "The administrator username for the PostgreSQL database."
  type        = string
  default     = "postadmin"
}

variable "login_server" {
  description = "ACR login server"
  type        = string
  default     = "weatherimage.azurecr.io"
}

variable "image_name" {
  description = "image name"
  type        = string
  default     = "weather-app:latest"
}

variable "database_name" {
  description = "The name of the PostgreSQL database."
  type        = string
  default     = "weatherdb"
}

variable "vnet_cidr" {
  type    = list(string)
  default = ["10.10.0.0/16"]
}

variable "db_subnet_cidr" {
  type    = list(string)
  default = ["10.10.1.0/24"]
}

variable "app_subnet_cidr" {
  type    = list(string)
  default = ["10.10.2.0/24"]
}

variable "acr_name" {
  type        = string
  default  = "weatherimage"
}

variable "acr_rg_name" {
  type        = string
  default   = "rg-working-israel"
}

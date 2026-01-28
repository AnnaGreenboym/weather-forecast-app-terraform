variable "prefix" {
  description = "The unique prefix for resource names."
  type        = string
}

variable "location" {
  description = "The Azure region for the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "admin_login" {
  description = "The administrator username for the database."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the database."
  type        = string
  sensitive   = true
}

variable "local_developer_ip" {
  description = "The public IP address of the developer's machine."
  type        = string
}

variable "database_name" {
  description = "The name of the PostgreSQL database."
  type        = string
}

variable "db_subnet_cidr" {
  type    = string
}

variable "private_dns_zone_id" {
  type    = string
}
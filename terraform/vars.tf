variable "resource_group_name" {
	default = "movie-analyst"
	description = "Name of the resource group."
}

variable "resource_group_location" {
	default = "eastus"
	description = "Location of the resource group."
}

variable "computer_name" {
	default = "azure"
	description = "Virtual machine hostname."
}

variable "admin_user" {
	default = "fcadmin"
	description = "Name of the admin user."
}

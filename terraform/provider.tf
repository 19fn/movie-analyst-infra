terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "movie-analyst"
        storage_account_name = "moviemaker"
        container_name       = "tfstate2"
        key                  = "terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "movie-analyst" {
	name = "movie-analyst"
}

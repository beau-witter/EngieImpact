# Configure the Azure provider
terraform {
  backend "azurerm" {
    storage_account_name = "mytstorageaccount"
    container_name = "terraform"
    key = "terraform.tfstate"

    
    sas_token = "sp=racwdl&st=2021-05-10T06:11:42Z&se=2021-05-10T14:11:42Z&spr=https&sv=2020-02-10&sr=c&sig=cRkBFrRUaP3bgUx2EsImP30Hy1K9rdrSD4f1KS6o2GE%3D"
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  subscription_id = "b58e387e-6bb2-4bc5-8ff9-41f1480aef27"
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
  }

resource "azurerm_container_registry" "acr" {
  name = "bwitterengieimpact"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Standard"
  admin_enabled = true
}

resource "azurerm_app_service_plan" "asp" {
  name = "${azurerm_resource_group.rg.name}-plan"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind = "Linux"

  sku {
    tier = "Standard"
    size = "S1"
  }

  reserved = true
}

resource "azurerm_app_service" "app" {
  name = "${azurerm_resource_group.rg.name}-app"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "DOCKER|bwitterengieimpact.azurecr.io/moon:latest"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = false
    "DOCKER_REGISTRY_SERVER_URL" = "https://bwitterengieimpact.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME" = "bwitterEngieImpact"
    "DOCKER_REGISTRY_SERVER_PASSWORD" = "a/eC5QECHaOXBJ/4xYbUDMd8Xqk8+zgv"
  }
}
variable "environment" {
  description = "The prefix used for all resources"
  default = "main"
}

variable "resource-group" {
    description = "The name of resource group to place all our resources"
    default = "remote-tfstate-rg"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default = "UK South"
}

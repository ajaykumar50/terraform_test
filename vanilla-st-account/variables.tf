variable "environment" {
  type        = string
  #default     = "prod"
  description = "description"
}

variable "rg_name" {
  type        = string
  #default     = "rg-main"
  description = "description"
}

variable "rg_location" {
  type        = string
  #default     = "eastus"
  description = "description"
}

variable "project_name" {
  type        = string
  #default     = "test"
  description = "description"
}

variable "sa_rep_type" {
  type = map(string)
  default = {
    "prod" = "GRS"
    "dev"  = "LRS"
  }
  description = "description"
}

variable "st_containers" {
  type        = list(string)
  default     = ["files", "process", "output"]
  description = "description"
}


locals {
  environment = var.environment
  project     = var.project_name
  name_prefix = "${var.project_name}${var.environment}"
  common_tags = {
    environment = local.environment
    projet      = local.project
  }
}

# Variable Declaration for Resource group name
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}

# Variable Declaration for Region
variable "location" {
  description = "The region in which the resources will be created."
  type        = string
  default     = "East Us"
}

# Variable Declaration for Vnet Names
variable "vnet_name" {
  description = "The name of the virtual network where the virtual machines will reside."
}

# Variable Declaration for Vnet address space
variable "vnet_address_space" {
  description = "The address of the virtual network where the virtual machines will reside"  
}

variable "ddos_protection" {
  
}
# Variable Declaration for Subnet names
variable "subnet_name1" {
  description = "The subnet name of the virtual network where the virtual machines will reside."
  type = string
}

# Variable Declaration for Subnet names
variable "subnet_name2" {
  description = "The subnet name of the virtual network where the virtual machines will reside."
  type = string
}

# Variable Declaration for Subnet names
variable "subnet_name3" {
  description = "The subnet name of the virtual network where the virtual machines will reside."
  type = string
}

# Variable Declaration for Subnet names
variable "subnet_name4" {
  description = "The subnet name of the virtual network where the virtual machines will reside."
  type = string
}

# Variable Declaration for Subnet names
variable "subnet_name5" {
  description = "The subnet name of the virtual network where the virtual machines will reside."
  type = string
}

# Variable Declaration for Subnet names
variable "subnet_name6" {
  description = "The subnet name of the virtual network where the virtual machines will reside."
  type = string
}

# Variable Declaration for Subnet address space
variable "subnet_address_space1" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
}

# Variable Declaration for Subnet address space
variable "subnet_address_space2" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
}

# Variable Declaration for Subnet address space
variable "subnet_address_space3" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
}

# Variable Declaration for Subnet address space
variable "subnet_address_space4" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
}

# Variable Declaration for Subnet address space
variable "subnet_address_space5" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
}

# Variable Declaration for Subnet address space
variable "subnet_address_space6" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
}

# Variable Declaration for Network security group
variable "nsg_name1" {
  type = string
}

variable "nsg_name2" {
  type = string
  
}

variable "nsg_name3" {
  type = string
}

variable "nsg_name4" {
  type = string
}

variable "apg_name" {
  type = string
}

variable "nsg_name6" {
  
}
variable "gateway_ip_config_name" {
  
}

variable "lb_name" {
  
}

variable "frontend_ip_config_name" {
  
}

variable "beapool_name" {
  
}

variable "nic_name1" {
  type = string
}

variable "nic_name2" {
  type = string
}

variable "nic_name3" {
  type = string
}

variable "nic_name4" {
  type = string
}

variable "jboxnic_name" {
  
}

variable "private_ip_address_allocation" {
  
}
variable "nic_ip_allocation_method" {
  
}

variable "nic_ip_config_name" {
  
}


variable "public_ip_name" {
  
}

variable "public_ip_name2" {
  
}

variable "public_ip_allocation_method" {
  
}


variable "vmss1" {
  type = string
}



variable "disable_password_authentication" {
  
}

variable "publisher" {
  
}

variable "offer" {
  
}

variable "sku" {
  
}

variable "vmss2" {
  type = string
}


variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "public_ip_name3" {
  
}

variable "public_ip_allocation_method2" {
  
}

variable "jbox_name" {
  
}

variable "jbox_ip_config_name" {
  
}
variable "storage_account_name" {
  
}

variable "storage_container_name" {
  
}
variable "storage_account_tier" {
  
}

variable "storage_account_replication_tier" {
  
}

variable "container_access_type" {
  
}

variable "blob_name" {
  
}


variable "blob_type" {
  
}

variable "access_tier" {
  
}

variable "index_document" {
  
}

variable "source_content" {
  
}


variable "sql_storage_account_name" {
  
}

variable "sql_server_name" {
  
}

variable "administartor" {
  
}

variable "login_password" {
  
}

variable "sql_vnet_rule_name" {
  
}

variable "sql_firewall_name" {
  
}

variable "start_ip" {
  
}

variable "end_ip" {
  
}
/*
variable "group_name" {
  
}

variable "user_principal_name" {
  
}

variable "admin_name" {
  
}

variable "user_password" {
  
}

variable "domain_name" {
  
}

variable "sku_ADDS" {
  
}
*/
# Variable Declaration for Environment Tag
variable "environment1" {
  description = "The environment name to be provided"
  type = string
}

# Variable Declaration for Environment Tag
variable "environment2" {
  description = "The environment name to be provided"
  type = string
}

# Variable Declaration for Environment Tag
variable "environment3" {
  description = "The environment name to be provided"
  type = string
}



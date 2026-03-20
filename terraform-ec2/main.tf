provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# 🟢 Resource Group
resource "azurerm_resource_group" "main" {
  name     = "devops-rg"
  location = "East US"
}

# 🟢 Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "devops-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# 🟢 Subnet
resource "azurerm_subnet" "main" {
  name                 = "devops-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

# 🟢 Public IP
resource "azurerm_public_ip" "main" {
  name                = "devops-public-ip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# 🟢 Network Interface
resource "azurerm_network_interface" "main" {
  name                = "devops-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

# 🟢 Network Security Group
resource "azurerm_network_security_group" "main" {
  name                = "devops-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

 security_rule {
  name                       = "allow-ssh"
  priority                   = 1000
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

security_rule {
  name                       = "allow-app"
  priority                   = 1001
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "3000"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

security_rule {
  name                       = "allow-jenkins"
  priority                   = 1003
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "8080"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
}

# 🟢 Associate NSG to NIC
resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}

# 🟢 Azure VM

resource "azurerm_linux_virtual_machine" "main" {
  name                = "devops-vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  disable_password_authentication = true

admin_ssh_key {
  username   = "azureuser"
  public_key = file("~/.ssh/azure-devops-key.pem.pub")
}

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

source_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts"
  version   = "latest"
}
}
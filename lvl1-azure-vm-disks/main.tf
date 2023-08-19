resource "azurerm_resource_group" "demo-rg" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_virtual_network" "demo" {
  resource_group_name = azurerm_resource_group.demo-rg.name
  name                = "${var.prefix}-network"
  location            = var.location

  address_space = [
    "10.0.0.0/16",
  ]
}

resource "azurerm_subnet" "demo" {
  virtual_network_name = azurerm_virtual_network.demo.name
  resource_group_name  = azurerm_resource_group.demo-rg.name
  name                 = "internal"

  address_prefixes = [
    "10.0.2.0/24",
  ]
}

resource "azurerm_network_interface" "demo" {
  resource_group_name = azurerm_resource_group.demo-rg.name
  name                = "${var.prefix}-nic"
  location            = var.location

  ip_configuration {
    subnet_id                     = azurerm_subnet.demo.id
    private_ip_address_allocation = "Dynamic"
    name                          = "testconfiguration1"
  }
}

resource "azurerm_virtual_machine" "demo" {
  vm_size                       = "Standard_F2"
  resource_group_name           = azurerm_resource_group.demo-rg.name
  name                          = "${var.prefix}-vm"
  location                      = var.location
  delete_os_disk_on_termination = true

  network_interface_ids = [
    azurerm_network_interface.demo.id,
  ]

  storage_os_disk {
    name              = "myosdisk1"
    managed_disk_type = "Standard_LRS"
    create_option     = "FromImage"
    caching           = "ReadWrite"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "external" {
  virtual_machine_id = azurerm_virtual_machine.demo.id
  managed_disk_id    = azurerm_managed_disk.external.*.id[count.index]
  lun                = count.index + 10
  count              = 10
  caching            = "ReadWrite"
}

resource "azurerm_managed_disk" "external" {
  storage_account_type = "Standard_LRS"
  resource_group_name  = azurerm_resource_group.demo-rg.name
  name                 = "${var.prefix}-disk${count.index + 1}"
  location             = var.location
  disk_size_gb         = 10
  create_option        = "Empty"
  count                = 10
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "vm_ssh_key"
  file_permission = "0600"
}

resource "local_file" "ssh_public_key" {
  content  = tls_private_key.ssh.public_key_openssh
  filename = "vm_ssh_key.pub"
}
resource "azurerm_public_ip" "lb_public_ip" {
  name = "lb-public-ip"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
}

resource "azurerm_lb" "load_balancer" {
  name = "scalable-lb"
  location = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name = "BackendPool"
}

resource "azurerm_lb_probe" "http_probe" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name = "http-probe"
  protocol = "Http"
  port = 80
  request_path = "/"
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name = "HttpRule"
  protocol = "Tcp"
  frontend_port = 80 
  backend_port = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id = azurerm_lb_probe.http_probe.id
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.backend_pool.id ]
}

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name = "scalable-vmss"
  resource_group_name = var.resource_group_name
  location = var.location
  sku = "Standard_B1s"
  instances = 2
  admin_username = var.admin_username

  admin_ssh_key {
    username = var.admin_username
    public_key = tls_private_key.ssh.public_key_openssh
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching = "ReadWrite"
  }

  network_interface {
    name = "vmss-nic"
    primary = true 

    ip_configuration {
      name = "internal"
      primary = true
      subnet_id = var.subnet_id
      load_balancer_backend_address_pool_ids = [ azurerm_lb_backend_address_pool.backend_pool.id ]
    }
  }

  custom_data = filebase64("script.sh")
}

resource "azurerm_monitor_autoscale_setting" "autoscale" {
  name = "autoscale-setting"
  resource_group_name = var.resource_group_name
  location = var.location
  target_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id

  profile {
    name = "auto-scale"

    capacity {
      default = 2
      minimum = 2
      maximum = 5
    }

    rule {
      metric_trigger {
        metric_name = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        time_grain = "PT1M"
        statistic = "Average"
        time_window = "PT5M"
        time_aggregation = "Average"
        operator = "GreaterThan"
        threshold = 75
      }

      scale_action {
        direction = "Increase"
        type = "ChangeCount"
        value = "1"
        cooldown = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        time_grain = "PT1M"
        statistic = "Average"
        time_window = "PT5M"
        time_aggregation = "Average"
        operator = "LessThan"
        threshold = 25
      }

      scale_action {
        direction = "Decrease"
        type = "ChangeCount"
        value = "1"
        cooldown = "PT5M"
      }
    }
  }
}
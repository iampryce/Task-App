# ── Outputs ─────────────────────────────────────
output "public_ip" {
  description = "Public IP of the VM"
  value       = azurerm_public_ip.main.ip_address
}

output "ssh_command" {
  description = "SSH into the VM"
  value       = "ssh -i ~/.ssh/azure-devops-key.pem azureuser@${azurerm_public_ip.main.ip_address}"
}

output "app_url" {
  description = "App URL"
  value       = "http://${azurerm_public_ip.main.ip_address}"
}

output "jenkins_url" {
  description = "Jenkins URL"
  value       = "http://${azurerm_public_ip.main.ip_address}:8080"
}
output "pmm_client_ip" {
  value = aws_instance.pmm_client.public_ip
}

output "pmm_server_ip" {
  value = aws_instance.pmm_server.public_ip
}
output "db_public_ip" {
  value = aws_instance.db.public_ip
}

output "web_public_ip" {
  value = aws_instance.web.public_ip
}

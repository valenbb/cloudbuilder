output "instance_public_ip" {
  value = ["${aws_instance.chef_server.*.public_ip}"]
}

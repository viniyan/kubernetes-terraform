resource "digitalocean_droplet" "ubuntu-s-1vcpu-1gb-ams3-01" {
  image    = "ubuntu-20-04-x64"
  name     = "ubuntu-s-1vcpu-1gb-ams3-01"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.teste.id
  ]

  connection {
    host = "143.198.24.3"
    user = "root"
    type = "ssh"
    private_key = "a6992e46dd04cb5a32ae3744004af83d6e0ec3a05382686221f9c8ce08603706"
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}
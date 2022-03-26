terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "a6992e46dd04cb5a32ae3744004af83d6e0ec3a05382686221f9c8ce08603706"
}

data "digitalocean_ssh_key" "teste" {
  name = "teste"
}

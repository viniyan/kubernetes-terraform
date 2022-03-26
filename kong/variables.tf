variable "node_count" {
  type = number
  default = 3
}

variable "region" {
  type = string
  default = "nyc3"
}

variable "image" {
  type = string
  default = "kong"
}

variable "port" {
  type = number
  default = 25565
}

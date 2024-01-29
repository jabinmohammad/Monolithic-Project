variable "server_names" {
  type = list(string)
  default = ["Master", "worker-1", "worker-2", "worker-3", "worker-4", "Monitor", "Sonarube"]
}

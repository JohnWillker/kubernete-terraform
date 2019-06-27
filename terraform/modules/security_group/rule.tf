variable "rules" {
  description = "Security Group rules name"
  type        = "map"
  default     = {
    # All protocols
    all-all       = [-1, -1, "-1", "All protocols"]
    # SSH
    ssh-tcp = [22, 22, "tcp", "SSH"]
    # HTTP
    http-80-tcp   = [80, 80, "tcp", "HTTP"]
    # HTTPS
    https-443-tcp  = [443, 443, "tcp", "HTTPS"]
  }
}

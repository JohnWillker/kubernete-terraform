
variable "name" {
  description = "Name of Security Group"
}
variable "vpc_id" {
  description = "Id of VPC"
}

variable "description" {
  description = "Description of Security Group"
}

variable "ingress_cidr_blocks" {
  description = "Description of Security Group"
  default     = []
}

variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  default     = []
}

variable "create" {
  description = "Whether to create security group and all rules"
  default     = true
}

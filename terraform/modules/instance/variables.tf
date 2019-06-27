variable "ami" {
  description = "ID of AMI to use for the instance"
}

variable "count" {
  description = "Number of instances to launch"
  default     = 1
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}

variable "instance_type" {
  description = "The type of instance to start"
}

variable "name" {
  description = "The name of instance"
}

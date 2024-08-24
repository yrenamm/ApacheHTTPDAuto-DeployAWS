# Define Input Variables

variable "aws_region" {
  type        = string
  description = "Region in which AWS Resources to be created"
  default     = "us-east-1"
}

variable "team" {
  type        = string
  description = "The team responsible for the resource."
  default     = "dev"
}

variable "key_pairs" {
  type        = string
  description = "Key Pairs Name"
  default     = "terraform-key"
}
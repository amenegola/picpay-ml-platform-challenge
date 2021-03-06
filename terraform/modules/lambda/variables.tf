variable "name" {
  description = "Function name"
  type        = string
}

variable "source_path" {
  description = "Path to function source code"
  type        = string
}

variable "handler" {
  description = "Handler for function call"
  type        = string
}

variable "runtime" {
  description = "Path to function source code"
  type        = string
  default     = "python3.7"
}

variable "timeout" {
  description = "Path to function source code"
  type        = number
  default     = 120
}

variable "publish" {
  description = "Path to function source code"
  type        = bool
  default     = true
}

variable "create_kinesis_policy" {
  description = "Create policy to enable lambda to publish at kinesis"
  type        = bool
  default     = false
}

variable "environment_variables" {
  description = "Environment variables for lambda function"
  type        = map
  default     = {PASS = "OK"}
}
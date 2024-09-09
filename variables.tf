##############################################################################
# Variables File
#
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
}

variable "region" {
    description = "The region where the resources are created."
    validation {
        condition     = contains(["us-east-1", "us-west-2", "eu-central-1"], var.region)
        error_message = "Must be one of the supported regions"
    }
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.10.0/24"
}

variable "instance_type" {
  description = "Specifies the AWS instance type."
  default     = "t2.micro"
}

variable "admin_username" {
  description = "Administrator user name for mysql"
  default     = "hashicorp"
}

variable "height" {
  default     = "600"
  description = "Image height in pixels."
}

variable "width" {
  default     = "600"
  description = "Image width in pixels."
}

variable "placeholder" {
    # default     = "loremflickr.com"
    description = "Image-as-a-service URL. Loremflickr (cats), placebear (bears) and placedog (turtles...jk)"
    validation {
        condition     = contains(["loremflickr.com", "placebear.com", "placedog.net"], var.region)
        error_message = "Please use one of the specified image-as-a-service URLs"
    }
}
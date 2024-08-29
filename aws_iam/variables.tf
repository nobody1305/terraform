variable "roles" {
  type = list(object({
    name               = string
    assume_role_policy = string
    inline_policy      = string
  }))
}

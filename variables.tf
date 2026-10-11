variable "lists" {
  description = <<EOT
Map of lists, attributes below
Required:
    - account_id
    - kind
    - name
Optional:
    - description
    - items
EOT

  type = map(object({
    account_id  = string
    kind        = string
    name        = string
    description = optional(string)
    items = optional(set(object({
      asn     = optional(number)
      comment = optional(string)
      hostname = optional(object({
        exclude_exact_hostname = optional(bool)
        url_hostname           = string
      }))
      ip = optional(string)
      redirect = optional(object({
        include_subdomains    = optional(bool)
        preserve_path_suffix  = optional(bool)
        preserve_query_string = optional(bool)
        source_url            = string
        status_code           = optional(number)
        subpath_matching      = optional(bool)
        target_url            = string
      }))
    })))
  }))
}


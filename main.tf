resource "cloudflare_list" "lists" {
  for_each = var.lists

  account_id  = each.value.account_id
  kind        = each.value.kind
  name        = each.value.name
  description = each.value.description
  items       = each.value.items
}


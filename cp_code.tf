data "akamai_group" "test" {
  group_name  = "Test Akamai"
  contract_id = var.contract_id
}


data "akamai_property_products" "example" {
  contract_id = var.contract_id
}

resource "akamai_cp_code" "cp_code" {
  name        = "My Terraform CP Code"
  contract_id = var.contract_id
  group_id    = data.akamai_group.test.id
  product_id  = data.akamai_property_products.example.products.0.product_id
}

output "akamai_cp_code" {
  value = akamai_cp_code.cp_code.id
}

output "akamai_group" {
  value = data.akamai_group.test.id
}

output "akamai_property_products" {
  value = data.akamai_property_products.example.products.0.product_id
}
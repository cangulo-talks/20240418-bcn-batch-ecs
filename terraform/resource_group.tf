

locals {
  resource_groups = {
    main = {
      name = local.resources_prefix
      resource_query = {
        ResourceTypeFilters = ["AWS::AllSupported"]
        TagFilters = [
          for k, v in local.tags : {
            Key    = k
            Values = [v]
          }
        ]
      }
    }
  }
}

resource "aws_resourcegroups_group" "this" {
  for_each    = local.resource_groups
  name        = each.value.name
  description = "Resource group for ${local.service_name} service. ${each.key} resources."

  resource_query {
    query = jsonencode(each.value.resource_query)
  }
}

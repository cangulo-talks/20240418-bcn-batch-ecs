locals {
  service_name     = "batch-orchestrator"
  resources_prefix = "${var.client}-${var.stage}-${var.service_group}-${local.service_name}"
  tags = {
    Client       = var.client
    Stage        = var.stage
    Repo         = "https://github.com/cangulo-talks/20240418-bcn-batch-ecs"
    Service      = local.service_name
    ServiceGroup = var.service_group
  }
}

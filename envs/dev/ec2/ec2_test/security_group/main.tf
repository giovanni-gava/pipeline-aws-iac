module "security_group" {
  source      = "../../../modules/security_group"
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id
  tags        = local.common_tags

  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
}

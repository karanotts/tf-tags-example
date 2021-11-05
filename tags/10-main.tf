locals {
  tags = {
    cost-centre = yamldecode(file("${path.module}/config.yaml"))[var.project]["tags"]["cost-centre"]
    application = yamldecode(file("${path.module}/config.yaml"))[var.project]["tags"]["application"]
    tier        = yamldecode(file("${path.module}/config.yaml"))[var.project]["tags"]["tier"]
    environment = [for x in keys(local.env_mapping) : x if contains(local.env_mapping[x], var.environment)][0]
    criticality = local.criticality[var.environment]
  }

  criticality = {
    sbox        = "Low"
    sandbox     = "Low"
    dev         = "Medium"
    development = "Medium"
    test        = "Medium"
    testing     = "Medium"
    stg         = "High"
    staging     = "High"
    prod        = "CRITICAL"
    production  = "CRITICAL"

  }

  env_mapping = {
    production  = ["prod", "production"]
    development = ["dev", "development"]
    staging     = ["stg", "staging"]
    testing     = ["test", "testing"]
    sandbox     = ["sbox", "sanbox"]
  }
}

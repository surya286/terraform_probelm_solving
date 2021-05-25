output "Users" {
  value = var.git-users[*]
}

output "project_mappings" {
  value = local.project_pairs
}

output "group_mappings"{
  value = local.group_pairs
}
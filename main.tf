# Adding git lab provider
terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.6.0"
    }
  }
}
# gitlab Connection establishment

provider "gitlab" {
  base_url = "http://localhost:8080/api/v4"
  token = "RhL6XGAvkp-Dajx-1b44"
}

# Randome Password Generator

resource "random_password" "randome_passwd" {
  length = 8
}

#       Hierarcy is :  1. groups ( red , green , blue )
#                      2. projects ( project_1 , 2, ..... , 9 )
#                      3. users (u_acquia_1 , 2 , .... `10) () Indipendenet



resource "gitlab_user" "CreateUser" {
  for_each = var.git-users
  email = each.value.email
  name = each.value.name
  password = random_password.randome_passwd.result
  username = each.key
}

resource "gitlab_group" "CreateGroup" {
  for_each = var.user-group-mappings
  name = each.key
  path = each.key
}

# mapping creation like below with locals
#group_mappings = {
#  "red" : "u_acquia_1"
#}
locals {
  group_pairs = flatten([
    for group_name , group in var.user-group-mappings : [
      for user_name , user  in group.users : {
        group = group_name
        user  = user
        access_role = group.access_role
      }
    ]
  ])
  project_pairs = flatten([
    for group_name, group in var.user-group-mappings : [
      for project_list, project in group.projects : {
        group   = group_name
        project = project
      }
    ]
  ])
}

resource "gitlab_group_membership" "adduserTOgroup" {
  for_each = {
    for addTOgroup in local.group_pairs : "${addTOgroup.group}.${addTOgroup.user}" => addTOgroup
  }
  group_id = "${gitlab_group.CreateGroup[each.value.group].id}"
  user_id = "${gitlab_user.CreateUser[each.value.user].id}"
  access_level = "developer"
}

resource "gitlab_project" "CreateProject" {
  for_each = {
    for createProject in local.project_pairs : "${createProject.group}.${createProject.project}" => createProject
  }
  name = each.value.project
  namespace_id = "${gitlab_group.CreateGroup[each.value.group].id}"
}
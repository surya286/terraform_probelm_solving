variable "gitlab-key" {
  default = "RhL6XGAvkp-Dajx-1b44"
  description = "Please provide access key run time if not specified in default"
}

#       Hierarcy is :  1. groups ( red , green , blue )
#                      2. projects ( project_1 , 2, ..... , 9 )
#                      3. users (u_acquia_1 , 2 , .... `10)


variable "git-users" {
  type = map(object({
    name = string
    email = string
    username = string
    group = string
  }))
  default = {
    u_acquia_1 = {
      name = "u_acquia_1"
      email = "u_acquia_1@example.com"
      username = "u_acquia_1"
      group = "red"
    },
    u_acquia_2 = {
      name = "u_acquia_2"
      email = "u_acquia_2@example.com"
      username = "u_acquia_2"
      group = "red"
    },
    u_acquia_3 = {
      name = "u_acquia_3"
      email = "u_acquia_3@example.com"
      username = "u_acquia_3"
      group = "red"
    },
    u_acquia_4 = {
      name = "u_acquia_4"
      email = "u_acquia_4@example.com"
      username = "u_acquia_4"
      group = "red"
    },
    u_acquia_5 = {
      name = "u_acquia_5"
      email = "u_acquia_5@example.com"
      username = "u_acquia_5"
      group = "red"
    },
    u_acquia_6 = {
      name = "u_acquia_6"
      email = "u_acquia_6@example.com"
      username = "u_acquia_6"
      group = "red"
    },
    u_acquia_7 = {
      name = "u_acquia_7"
      email = "u_acquia_7@example.com"
      username = "u_acquia_7"
      group = "red"
    },
    u_acquia_8 = {
      name = "u_acquia_8"
      email = "u_acquia_8@example.com"
      username = "u_acquia_8"
      group = "red"
    },
    u_acquia_9 = {
      name = "u_acquia_9"
      email = "u_acquia_9@example.com"
      username = "u_acquia_9"
      group = "red"
    },
    u_acquia_10 = {
      name = "u_acquia_10"
      email = "u_acquia_10@example.com"
      username = "u_acquia_10"
      group = "red"
    }
  }
}

variable "user-group-mappings" {
  type = map(object({
    users = list(string)
    group = string
    projects = list(string)
    access_role = string
  }))
  default = {
    red = {
      users = ["u_acquia_1","u_acquia_2","u_acquia_6","u_acquia_9"]
      group = "red"
      projects = ["Project_acquia_1","Project_acquia_2","Project_acquia_3"]
      access_role = "reporter"
    },
    green = {
      users = ["u_acquia_3","u_acquia_4","u_acquia_5","u_acquia_6","u_acquia_7","u_acquia_8"]
      group = "green"
      projects = ["Project_acquia_4","Project_acquia_5","Project_acquia_6"]
      access_role = "developer"
    },
    blue = {
      users = ["u_acquia_4","u_acquia_5","u_acquia_6","u_acquia_9","u_acquia_10"]
      group = "blue"
      projects = ["Project_acquia_4","Project_acquia_8","Project_acquia_9"]
      access_role = "maintainer"
    }
  }
}
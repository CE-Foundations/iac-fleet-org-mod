/**
* Copyright 2022 Google LLC
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


module "top_level" {
  source            = "terraform-google-modules/folders/google"
  version           = "3.1.0"
  parent            = "folders/${var.parent_folder}"
  names             = var.org["top-folders"]
}

module "level1_folders" {
  source            = "terraform-google-modules/folders/google"
  version           = "3.1.0"
  for_each          = {for k, v in module.top_level.ids_list : k => v}
  parent            = each.value
  names             = var.org[module.top_level.folders[each.key].display_name]
}

module "level2_folders" {
  source            = "terraform-google-modules/folders/google"
  version           = "3.1.0"
  for_each          = {for k, v in flatten([for b in module.level1_folders : b.ids_list] ) : k => v if length(var.org[flatten([for b in module.level1_folders : b.folders])[k].display_name]) > 0}
  parent            = each.value
  names             = var.org[flatten([for b in module.level1_folders : b.folders])[each.key].display_name]
}

##
#### Enable in case need of 4 level deep folder structure
##
# module "level3_folders" {
#   source            = "terraform-google-modules/folders/google"
#   version           = "3.1.0"
#   for_each          = {for k, v in flatten([for b in module.level2_folders : b.ids_list] ) : k => v if length(var.folder[flatten([for b in module.level2_folders : b.folders])[k].display_name]) > 0}
#   parent            = each.value
#   names             = var.org[flatten([for b in module.level2_folders : b.folders])[each.key].display_name]
# }

##
#### for_each statement should point to the lowest level module created
##
# module "fleet_controlPlane" {
#   source            = "terraform-google-modules/folders/google"
#   version           = "3.1.0"
#   for_each          = {for k, v in flatten([for b in module.level2_folders : b.ids_list] ) : k => v }
#   parent            = each.value
#   names             = var.fleet_controlPlaneName

# }

# module "fleet_controlPlane_folders" {
#   source            = "terraform-google-modules/folders/google"
#   version           = "3.1.0"
#   for_each          = {for k, v in flatten([for b in module.fleet_controlPlane : b.ids_list] ) : k => v }
#   parent            = each.value
#   names             = var.fleet_controlPlane[flatten([for b in module.fleet_controlPlane : b.folders])[each.key].display_name]

# }
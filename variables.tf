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

variable "parent_folder" {
  type        = string
  description = "Parent folder to be used to create all resources (including additional folders)."
  nullable    = false
  validation {
    condition     = can(regex("(^[0-9A-z-_.]+$)", var.parent_folder))
    error_message = "Parent folder ID may only contain alphanumeric characters, numbers, dash, dot and underscore."
  }
}

variable "parent_org" {
  description = "The organization parent for the associated services"
  type        = string
}

variable "org" {
  description = "tuples of parent with a list of folder childs"
  type = map
}

variable "fleet_controlPlaneName" {
  description = "Name of fleet control plane folder"
  type = list(string)
}

variable "fleet_controlPlane" {  
  description = "Map with a list of folder in control plane folder"
  type = map
}

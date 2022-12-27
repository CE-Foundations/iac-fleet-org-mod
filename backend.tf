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

# Backend for Terraform state storage
terraform {
  required_version = "> 1.3.0"
  backend "gcs" {
    bucket = "ce-tf-backend"                           # Bootstrap project state bucket name
    prefix = "terraform/state/generic/3-org-structure" # Ensure path is unique across logical Terraform modules!
  }
}
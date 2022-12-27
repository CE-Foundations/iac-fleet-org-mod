# Module `fleet_org` 

This module creates the org folders.

## Variables

- parent_org (string) => Organiztion ID
  format: "organizations/[org_id]"

- parent_folder (string) => Parent folder where all fleet folders will be.
  format: "392414087983"

- org (map) => Map of maps of folders with its childs as a list of strings.
  format:

  org = {
    top-folders = [
      "region-1",
      "region-2",
      "region-3"
    ]
    region-1 = [
      "country-1A",
      "country-1B",
      "country-1C"
    ]
  }

## Output

fleet folders created. Output intended for iac-fleet-mod
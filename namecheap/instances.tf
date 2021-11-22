resource "namecheap_domain_records" "nahsi-dev" {
  domain = "nahsi.dev"
  mode   = "MERGE"

  record {
    hostname = "syria"
    type     = "A"
    address  = "91.245.37.33"
  }

  record {
    hostname = "asia"
    type = "A"
    address = "81.23.150.126"
  }


  record {
    hostname = "jellyfin"
    type     = "A"
    address  = "91.245.37.33"
  }
}

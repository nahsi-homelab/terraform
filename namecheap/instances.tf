resource "namecheap_domain_records" "nahsi-dev" {
  domain = "nahsi.dev"
  mode   = "MERGE"

  # instances
  record {
    hostname = "tyros"
    type     = "A"
    address  = "91.245.37.33"
  }

  record {
    hostname = "smyrna"
    type     = "A"
    address  = "81.23.150.126"
  }


  # dc
  record {
    hostname = "syria"
    type     = "A"
    address  = "91.245.37.33"
  }

  record {
    hostname = "asia"
    type     = "A"
    address  = "81.23.150.126"
  }


  # services
  record {
    hostname = "jellyfin"
    type     = "A"
    address  = "91.245.37.33"
  }

  record {
    hostname = "audioserve"
    type     = "A"
    address  = "91.245.37.33"
  }
}

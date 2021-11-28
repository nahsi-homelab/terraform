locals {
  syria = "91.245.37.33"
  asia = "81.23.150.126"
  pontus = "194.233.161.117"
}

resource "namecheap_domain_records" "nahsi-dev" {
  domain = "nahsi.dev"
  mode   = "MERGE"

  record {
    hostname = "@"
    type     = "A"
    address  = local.syria
  }

  # dc
  record {
    hostname = "syria"
    type     = "A"
    address  = local.syria
  }

  record {
    hostname = "asia"
    type     = "A"
    address  = local.asia
  }


  # services
  record {
    hostname = "jellyfin"
    type     = "CNAME"
    address  = "syria.nahsi.dev"
  }

  record {
    hostname = "audioserve"
    type     = "CNAME"
    address  = "syria.nahsi.dev"
  }
}
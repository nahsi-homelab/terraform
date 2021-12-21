locals {
  syria  = "91.245.37.33"
  asia   = "81.23.150.126"
  pontus = "194.233.161.117"
}

resource "namecheap_domain_records" "nahsi-dev" {
  domain = "nahsi.dev"
  mode   = "MERGE"

  record {
    hostname = "@"
    type     = "A"
    address  = local.syria
    ttl      = "7200"
  }

  record {
    hostname = "@"
    type     = "A"
    address  = local.asia
    ttl      = "7200"
  }

  # dc
  record {
    hostname = "syria"
    type     = "A"
    address  = local.syria
    ttl      = "7200"
  }

  record {
    hostname = "asia"
    type     = "A"
    address  = local.asia
    ttl      = "7200"
  }

  # services
  record {
    hostname = "jellyfin"
    type     = "CNAME"
    address  = "syria.nahsi.dev"
    ttl      = "7200"
  }

  record {
    hostname = "audioserve"
    type     = "CNAME"
    address  = "syria.nahsi.dev"
    ttl      = "7200"
  }

  # mail
  record {
    hostname = "mail"
    type     = "CNAME"
    address  = "syria.nahsi.dev"
    ttl      = "7200"
  }

  record {
    hostname = "mail"
    type     = "CNAME"
    address  = "asia.nahsi.dev"
    ttl      = "7200"
  }

  # LLPSI
  record {
    hostname = "llpsi"
    type     = "CNAME"
    address  = "asia.nahsi.dev"
    ttl      = "7200"
  }

  record {
    hostname = "llpsi"
    type     = "CNAME"
    address  = "syria.nahsi.dev"
    ttl      = "7200"
  }

  # s3
  record {
    hostname = "minio"
    type     = "CNAME"
    address  = "asia.nahsi.dev"
    ttl      = "7200"
  }

  record {
    hostname = "minio"
    type     = "CNAME"
    address  = "syria.nahsi.dev"
    ttl      = "7200"
  }

  record {
    hostname = "s3"
    type     = "CNAME"
    address  = "asia.nahsi.dev"
    ttl      = "7200"
  }

  record {
    hostname = "s3"
    type     = "CNAME"
    address  = "syria.nahsi.dev"
    ttl      = "7200"
  }
}

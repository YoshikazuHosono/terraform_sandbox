terraform {
  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.11.4"
    }
  }
}

provider "volterra" {
  api_p12_file = "api_credential.p12"
  url          = "https://tenant.console.ves.volterra.io/api"
}

resource "volterra_http_loadbalancer" "lb-name" {
  name      = ""
  namespace = ""
  domains   = [""]

  routes {
    simple_route {
      path {
        prefix = "/"
      }
      http_method = "ANY"
      advanced_options {
        prefix_rewrite            = "/"
        disable_web_socket_config = false
      }
      origin_pools {
        cluster {
          name      = ""
          namespace = ""
          tenant    = ""
        }
        pool {
          name      = ""
          namespace = ""
          tenant    = ""
        }
        priority = 1
        weight   = 1
      }
    }
  }
}

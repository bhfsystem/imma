variable sys_nets {
  default = {
    _reserved_24 = [0, 1, 6]
    common       = [2, 3, 4, 5]
    _reserved_28 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    nat          = [10, 11, 12, 13]
  }
}

variable service_nets {
  default = {
    _reserved_services = [96, 97, 98]
    openvpn            = [99, 100, 101, 1000]
    bastion            = [102, 103, 104, 1001]
    irssi              = [105, 106, 107, 1006]
    packer             = [108, 109, 110, 1007]
    blocks             = [123, 124, 125, 1008]
    aptly              = [111, 112, 113, 1002]
    nexus              = [114, 115, 116, 1003]
    dns                = [117, 118, 119, 1004]
    ntp                = [120, 121, 122, 1005]
  }
}

variable public_network {
  default = {
    openvpn = "0"
    bastion = "0"
    packer  = "0"
    blocks  = "0"
    aptly   = "0"
    nexus   = "0"
    dns     = "0"
    ntp     = "0"
    irssi   = "0"
  }
}

variable want_fs {
  default = {
    openvpn = "0"
    bastion = "0"
    packer  = "0"
    blocks  = "0"
    aptly   = "0"
    nexus   = "0"
    dns     = "0"
    ntp     = "0"
    irssi   = "0"
  }
}

variable env {
  default = {
    sandbox = {
      cidr   = "172.16.0.0/16"
      region = "us-west-1"
    }

    _reserved_docker = {
      cidr   = "172.17.0.0/16"
      region = ""
    }

    prod = {
      cidr   = "172.18.0.0/16"
      region = "us-east-2"
    }

    admin = {
      cidr   = "172.19.0.0/16"
      region = "us-east-1"
    }

    dev = {
      cidr   = "172.20.0.0/16"
      region = "us-west-2"
    }

    ireland = {
      cidr   = "172.21.0.0/16"
      region = "eu-west-1"
    }

    stage = {
      cidr   = "172.22.0.0/16"
      region = "us-east-2"
    }

    network = {
      cidr   = "172.23.0.0/16"
      region = "us-east-1"
    }
  }
}
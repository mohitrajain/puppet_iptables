# @summary 
#   installing iptables service

# @example
#   include iptables::install
class iptables::install {

  package { "${iptables::package}":
    ensure => present
  }

  # enabling and running
  service { "$iptables::service":
    ensure => running,
    enable => true
  }

}

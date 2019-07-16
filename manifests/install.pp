# @summary 
#   installing iptables service

# @example
#   include iptables::install
class iptables::install {

  package { "${iptables::package}":
    ensure => present
  }

}

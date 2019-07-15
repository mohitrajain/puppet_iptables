# @summary 
#   Defining paramters for different distros
#
# @example
#   include iptables::params

class iptables::params {

  case $facts['os']['family'] {
    'RedHat': {
      $params_package  = 'iptables-services'
      $params_service  = 'iptables'
      $params_firewall = 'firewalld'  
    }

    'Debian': {
      $params_package  = 'iptables-persistent'
      $params_service  = 'netfilter-persistent'
      $params_firewall = 'ufw'
    }

  }

}

# @summary 
#   Stop and disable by default firewall services and later install ipatables.service
#
# @example
#   include iptables

class iptables (
  $firewall = $iptables::params::params_firewall
) inherits iptables::params {

  service { "$firewall":
    ensure => stopped,
    enable => false
  }

# installing iptables.service 
  include iptables::install

# inserting rule for port 80

  exec { "iptables -t filter -I INPUT -p tcp --dport 80 -j ACCEPT":
    path  => ['/usr/bin', '/usr/sbin',]
  }
}

# @summary 
#   Stop and disable by default firewall services and later install ipatables.service
#
# @example
#   include iptables

class iptables ( 
  String $package,
  String $service,
  String $firewall,
) {

  service { "${iptables::firewall}":
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

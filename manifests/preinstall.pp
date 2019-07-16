# @summary 
#   This will make sure that custom firewall like firewalld and ufw has stopped and disabled.
#
# @example
#   include iptables::preinstall

class iptables::preinstall {
  service { "$iptables::firewall":
    ensure => stopped,
    enable => false
  }

}

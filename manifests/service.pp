# @summary 
#   class to start service
#
# @example
#   include iptables::service

class iptables::service {

  # enabling and running
  service { "$iptables::service":
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }

}

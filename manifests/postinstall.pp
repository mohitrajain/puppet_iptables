# @summary 
#   adding the following rules to the table and then saving the rules
#
# @example
#   include iptables::postinstall

class iptables::postinstall {

# inserting rule for port 80
  exec { "iptables -t filter -I INPUT -p tcp --dport 80 -j ACCEPT":
    path  => ['/usr/bin', '/usr/sbin',]
  }

# saving rules to their specific locations

  exec { "iptables-save > $iptables::savepath":
    path  => ['/usr/bin', '/usr/sbin',]
  }

}

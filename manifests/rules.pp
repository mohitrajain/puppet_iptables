# @summary 
#   This resource type will hold custom rules for iptables

# @example
#  iptables::rules { 'centos_rules':
#    keep_default => true,
#    rules_arr => ['-A INPUT -p tcp --dport 8080 -j ACCEPT'],  
#  }


define iptables::rules (
  Array[String] $rules_arr,
  Boolean $keep_default
) {
  file { 'new_iptables_rules_file':
    ensure  => "$iptables::config_ensure",
    path    => "$iptables::rules_file",
    content => epp("iptables/iptables.rules.epp", {'rules_arr' => $rules_arr, 'default' => $keep_default}),
    mode    => "0644",
    owner   => "root",
    group   => "root",
    notify  => Service["$iptables::service"],
  }

  # here I have used a hack to move contents of latest created file to save path file
  exec { "cp $iptables::savepath $iptables::savepath.old; cp $iptables::rules_file $iptables::savepath":
    path  => ['/usr/bin', '/usr/sbin',]
  }

  # restarting service
  exec { "$iptables::restart_cmd":
    path  => ['/usr/bin', '/usr/sbin',]
  }


}

# @summary 
#   creating default rules file
#
# @example
#   include iptables::config
class iptables::config {
  file { 'iptables_save_file':
    ensure => "$iptables::config_ensure",
    path   => "$iptables::savepath",
    source => "puppet:///modules/iptables/iptables.rules",
    mode   => "0644",
    owner  => "root",
    group  => "root",
  }
}

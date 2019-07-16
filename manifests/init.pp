# @summary 
#   Stop and disable by default firewall services and later install ipatables.service
#
# @example
#   include iptables

class iptables ( 
  String $package,
  String $service,
  String $firewall,
  String $savepath,
  String $config_ensure,
  String $rules_file,
  String $restart_cmd,
) {

  contain iptables::preinstall
  contain iptables::install
  contain iptables::config
  contain iptables::service
  contain iptables::postinstall

  Class['::iptables::preinstall']
  -> Class['::iptables::config']
  -> Class['::iptables::install']
  -> Class['iptables::service']
  -> Class['::iptables::postinstall']

}

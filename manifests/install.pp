# @summary 
#   installing iptables service

# @example
#   include iptables::install
class iptables::install (
  $package = $iptables::params::params_package,
  $service = $iptables::params::params_service,
) inherits iptables::params {

  package { "$package":
    ensure => present
  }

  # enabling and running
  service { "$service":
    ensure => running,
    enable => true
  }

}

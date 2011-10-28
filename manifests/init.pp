# Class: rubygems
#   This class ensured that a given version of rubygems is installed
# Usage:
#   In a dependent class:
#     Class[rubygems] -> Class[yourclass]
#   In a node:
#     class { 'rubygems': version => '1.5.3' }
class rubygems( $version = latest ) {
  
  case $::operatingsystem {
    /Debian|Ubuntu/: { class { 'rubygems::debian': version => $version } }
    default: { err("Module 'rubygems' does not support OS ${::operatingsystem}") }
  }
}

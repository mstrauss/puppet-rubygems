# Class: rubygems
#   This class ensures that a given version latest of Rubygems is installed.
#   Per default, it keeps Rubygems up-to-date with the latest and greatest.
#
# Usage:
#   In a dependent class:
#     Class[rubygems] -> Class[yourclass]
#   In a node:
#     class { 'rubygems': }                       # keep Rubygems up-to-date
#     class { 'rubygems': version => '1.5.3' }    # force to stay on 1.5.3
#
class rubygems( $version = latest ) {
  
  case $::operatingsystem {
    /Debian|Ubuntu/: { class { 'rubygems::debian': version => $version } }
    default: { err("Module 'rubygems' does not support OS ${::operatingsystem}") }
  }
}

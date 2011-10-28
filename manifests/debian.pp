# Class: rubygems::debian( $version )
#
#
class rubygems::debian( $version ) {

  if $version == latest {
    
    if gem_fixed_version( 'rubygems-update' ) != $::rubygemversion {
      $_do_update = true
      # we need to clear the version so that 'gem update --system' simply upgrades to the latest version
      $_version = ''
      # we need to update rubygems-update first!
      package { 'rubygems-update': ensure => latest, provider => gem, notify => Exec['update system'] }
    } else {
      $_do_update = false
      debug( "${::fqdn} seems to be on the latest rubygems version: ${::rubygemversion}" )
    }
    
  } else {

    if $::rubygemversion != $version {
      $_do_update = true
      $_version = $version
    } else {
      $_do_update = false
      debug( "${::fqdn} seems to have the required rubygems version: ${version}" )
    }
    
  }
  
  if $_do_update == true {
    notice( "Updating rubygems on ${::fqdn} from version ${::rubygemversion} to ${version}")
    exec { 'update system':
      command => "/usr/bin/gem update --system ${_version}",
    }
  }

}

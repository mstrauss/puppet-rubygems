require 'rubygems'
require 'rubygems/user_interaction'
require 'rubygems/dependency_installer'

module Puppet::Parser::Functions
  newfunction(:gem_fixed_version, :type => :rvalue) do |args|
    name = args[0]
    version = args[1]
    begin
      installer = Gem::DependencyInstaller.new
      dep = Gem::Dependency.new( name, version )
      candidates = installer.find_gems_with_sources( dep )
      rec = candidates.last[0].version.to_s
      puts "Recommending version '#{rec}' for gem '#{name}'."
      return rec
    rescue
      raise Puppet::ParseError "in gem_fixed_version: #{$!}"
    end
  end
end

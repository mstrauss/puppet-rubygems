Facter.add("rubygemversion") do
  setcode do
    `/usr/bin/gem --version 2> /dev/null`.strip
  end
end

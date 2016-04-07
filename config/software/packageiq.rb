name 'packageiq'

if ENV['PACKAGEIQ_VERSION'].nil?
  raise("Must set 'PACKAGEIQ_VERSION'")
end

default_version ENV['PACKAGEIQ_VERSION']

dependency 'ruby'
dependency 'rubygems'
dependency 'packageiq-source'

build do
  gem "install packageiq -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
end

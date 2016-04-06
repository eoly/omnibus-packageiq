name 'packageiq'

default_version ENV['PACKAGEIQ_VERSION']

dependency 'ruby'
dependency 'rubygems'

build do
  gem "install packageiq -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
end

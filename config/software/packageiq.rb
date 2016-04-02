name 'packageiq'
default_version '0.1.1'

dependency 'ruby'
dependency 'rubygems'

build do
  gem "install packageiq -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"
end

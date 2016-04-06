name 'packageiq'

if ENV['PACKAGEIQ_VERSION'].nil?
  raise("Must set 'PACKAGEIQ_VERSION'")
end

source git: 'https://github.com/eoly/packageiq.git'

default_version ENV['PACKAGEIQ_VERSION']

dependency 'ruby'
dependency 'rubygems'

relative_path 'packageiq/build'

build do
  gem "install packageiq -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"

  mkdir '/etc/packageiq'
  copy 'etc/packageiq/rabbitmq.json', '/etc/packageiq/rabbitmq.json'
  copy 'etc/packageiq/elasticsearch.json', '/etc/packageiq/elasticsearch.json'
  copy 'etc/packageiq/indexer.json', '/etc/packageiq/indexer.json'
  copy 'lib/systemd/system/piq_indexer.service', '/lib/systemd/system/piq_indexer.service'
end

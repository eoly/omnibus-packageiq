name 'packageiq'

if ENV['PACKAGEIQ_VERSION'].nil?
  raise("Must set 'PACKAGEIQ_VERSION'")
end

source git: 'https://github.com/eoly/packageiq.git'

default_version ENV['PACKAGEIQ_VERSION']

dependency 'ruby'
dependency 'rubygems'

relative_path 'packageiq'

build do
  gem "install packageiq -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}"

  mkdir '/etc/packageiq'
  copy 'build/etc/packageiq/rabbitmq.json', '/etc/packageiq/rabbitmq.json'
  copy 'build/etc/packageiq/elasticsearch.json', '/etc/packageiq/elasticsearch.json'
  copy 'build/etc/packageiq/indexer.json', '/etc/packageiq/indexer.json'

  mkdir '/etc/profile.d'
  copy 'build/etc/profile.d/packageiq.sh', '/etc/profile.d/packageiq.sh'

  mkdir '/etc/cron.d'
  copy 'build/etc/cron.d/packageiq', '/etc/cron.d/packageiq.sh'

  if ohai['platform_family'] == 'rhel'
    if ohai['platform_version'].to_f >= 7
      mkdir '/lib/systemd/system'
      copy 'build/lib/systemd/system/piq_indexer.service', '/lib/systemd/system/piq_indexer.service'
    end
  end
end

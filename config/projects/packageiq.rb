#
# Copyright 2016 YOUR NAME
#
# All Rights Reserved.
#

name "packageiq"
maintainer "Eric Olsen <eric@ericolsen.net>"
homepage "https://github.com/eoly/packageiq"

# Defaults to C:/packageiq on Windows
# and /opt/packageiq on all other platforms
install_dir "#{default_root}/#{name}"

build_version do
  source :version, from_dependency: 'packageiq'
end

if ENV['BUILD_ITERATION'].nil?
  raise("Must set 'BUILD_ITERATION'")
end

build_iteration ENV['BUILD_ITERATION']

extra_package_file '/etc/packageiq/rabbitmq.json'
extra_package_file '/etc/packageiq/elasticsearch.json'
extra_package_file '/etc/packageiq/indexer.json'

config_file '/etc/packageiq/rabbitmq.json'
config_file '/etc/packageiq/elasticsearch.json'
config_file '/etc/packageiq/indexer.json'

extra_package_file '/etc/profile.d/packageiq.sh'
extra_package_file '/etc/cron.d/packageiq'

if ohai['platform_family'] == 'rhel'
  if ohai['platform_version'].to_f >= 7
    extra_package_file '/lib/systemd/system/piq_indexer.service'
  end
end

# Creates required build directories
dependency "preparation"

dependency "packageiq"

# Version manifest file
#dependency "version-manifest"

exclude '/etc'
exclude '/lib'
exclude "**/.git"
exclude "**/bundler/git"

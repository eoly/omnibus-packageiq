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

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

dependency "packageiq"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"

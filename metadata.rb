name             'gitolite'
maintainer       'OSU Open Source Lab'
maintainer_email 'systems@osuosl.org'
license          'Apache 2.0'
description      'Installs/Configures gitolite'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe  "default" "Install and configure ALL the things!"
recipe  "package" "Install gitolite from the available package manager"
recipe  "source"  "Install gitolite from source, e.g. a git clone"

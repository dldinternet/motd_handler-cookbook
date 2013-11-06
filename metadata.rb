name             "motd_handler"
maintainer       "Intuit, Inc."
maintainer_email "kevin_young@intuit.com"
license          "Apache 2.0"
description      "Chef Handler for updating /etc/motd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "chef_handler", "~> 1.1.0"

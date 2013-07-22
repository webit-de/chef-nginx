maintainer       "Jens Kraemer"
maintainer_email "jk@jkraemer.net"
license          "MIT"
description      "Installs/Configures nginx"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends 'apt'
recipe "nginx", "Installs and configures nginx"
%w{ ubuntu debian }.each do |os|
  supports os
end

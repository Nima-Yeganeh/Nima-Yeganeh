# apt install puppet
puppet apply -e 'file { "/var/save/puppet_hello/hellopuppet.txt": content => "Hello Puppet" }'

# bash hellopuppet.pp

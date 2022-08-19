class { 'puppetdb::server':
  database_host         => 'postgres',
  database_username     => 'puppetdb',
  database_password     => 'puppetdb',
  listen_address        => '0.0.0.0',
  ssl_listen_address    => '0.0.0.0',
}

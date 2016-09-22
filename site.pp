node puppetnode1 {
   package { 'nginx':
        ensure=>'installed'
}

notify { 'Nginx is installed.':
}

service { 'nginx':
        ensure=>'running'
}

notify { 'Nginx is running.':
}

  include '::mysql::server'

  mysql_database { 'prod_mdb':
    ensure  => 'present',
    charset => 'utf8',
  }

  mysql_user { 'prod_user@localhost':
    ensure  => 'present',
  }

  mysql_grant { 'prod_user@localhost/*.*':
    ensure => 'present',
    options => ['GRANT'],
    privileges => ['ALL'],
    table => '*.*',
    user => 'prod_user@localhost',
  }
}

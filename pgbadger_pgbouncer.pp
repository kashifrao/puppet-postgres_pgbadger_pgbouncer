# == Class: project::pgbadger_pgbouncer
 


class  project::pgbadger_pgbouncer(
  {

    
 # ---------------------------------------------------------------------------- 
 # Installation pgbadger 
 
        package { 'pgbadger':    
     ensure => $ensure, 
     }
     
     
     
         # ---------------------------------------------------------------------------- 
 # Installation pgbouncer 
 
   package { 'pgbouncer':    
      ensure => $ensure, 
     }

     file { '/etc/init.d/pgbouncer':
   ensure => 'present',
   owner  => 'root',
   group  => 'root',
   mode   => '0755',
   notify => Service['pgbouncer']
 }

file { '/etc/pgbouncer/pgbouncer.ini':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('bundle/project/dbmgmt/pgbouncer.erb'),
  }
  
  
 
 file { '/etc/pgbouncer/userlist.txt':
    ensure  => file,
    owner   => 'pgbouncer',
    group   => 'pgbouncer',
    mode    => '0600',
    content => template('bundle/project/dbmgmt/userlist.erb'),
  }
 
 service { "pgbouncer":
ensure => running, 	
enable => true,
}


 
 
  
  
# ----------------------------------------------------------------------------
# Add any additional settings *above* this comment block.
# ----------------------------------------------------------------------------


}

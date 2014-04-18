class db-demouser::config {
    include variables::init
    $passwd = $variables::init::passwd
    include db-root::config
    Class['db-root::config'] -> Class['db-demouser::config']
    exec { "db-create-demouser":
        unless => "/usr/bin/mysql -udemouser -pdemopass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -p$passwd -e \"create database voyage_challenge; grant all on voyage_challenge.* to voyage_challenge@localhost identified by 'vagrant';\"",
    }
}

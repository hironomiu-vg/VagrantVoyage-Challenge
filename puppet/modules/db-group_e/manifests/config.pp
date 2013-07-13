class db-group_e::config {
    include db-root::config
    Class['db-root::config'] -> Class['db-group_e::config']
    exec { "db-create-group_e":
        unless => "/usr/bin/mysql -ugroup_e -pgroup_epass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -pvagrant -e \"create database group_e; grant all on group_e.* to group_e@localhost identified by 'group_epass';\"",
    }
}

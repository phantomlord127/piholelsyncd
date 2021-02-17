settings {
        logfile = "/var/log/lsyncd/lsyncd.log",
        statusFile = "/var/log/lsyncd/lsyncd.status",
    statusInterval = 1,
    maxProcesses = 1,
}

sync {
        default.rsyncssh,
        source = "/etc/pihole/",
        host = "TargetIPAddress",
    targetdir = "/var/docker-data/pihole/etc/",
    delete = false,
        exclude = { '*.leases' , '*.log' , '*.domains' , '*.conf' , 'GitHubVersions' , 'list.preEventHorizon' , 'local*' , 'logrotate' , 'pihole-FTL.*' },
        rsync = {
                archive = true,
                compress = false,
        whole_file = true,
        rsh = "/usr/bin/ssh -l pihole-rsync",
        }
}

bash = {
    delay = 5,
    maxProcesses = 1,
    onCreate = "docker exec pihole pihole restartdns reload-lists",
    onModify = "docker exec pihole pihole restartdns reload-lists",
    onDelete = "docker exec pihole pihole restartdns reload-lists",
    onMove   = "docker exec pihole pihole restartdns reload-lists",
}


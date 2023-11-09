use bf
use bf-s6
use conf.nu

# the name of the restarting environment variable
const restarting = "APACHE_RESTARTING"

# Returns true if the Apache service is restarting
export def is_restarting [] { bf env check $restarting }

# Returns true if the Apache server is running
export def is_up [] { { ^pidof httpd } | bf handle -i | $in != "" }

# Restart Apache using apachectl
export def restart [] {
    # if Apache is in the middle of restarting, do nothing
    if (is_restarting) {
        bf write debug "Apache is already restarting." ctl/restart
        exit 0
    }

    # if Apache is already running, exit gracefully
    if not (is_up) {
        bf write debug "Apache is not running." ctl/restart
        exit 0
    }

    # test configuration before restarting
    bf write debug "Testing configuration." ctl/restart
    conf test

    # mark Apache as restarting and then stop
    bf env set $restarting 1
    { ^apachectl stop } | bf handle ctl/restart
}

# Unset the restarting environment variable
export def --env starting [] { bf env unset $restarting }

# Stop the Apache service gracefully
export def stop [] {
    bf write debug "Stopping Apache." ctl/stop
    { ^apachectl graceful-stop } | bf handle
}

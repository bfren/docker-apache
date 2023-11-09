use bf
use conf.nu
use ctl.nu

export def preflight [] {
    # load environment
    bf env load

    # manually set executing script
    bf env x_set --override run apache

    # Mark Apache as starting
    ctl starting

    # if Apache is already running, exit gracefully
    if (ctl is_up) {
        bf write debug "Apache is already running."
        exit 0
    }

    # Test Apache configuration
    conf test

    # if we get here we are ready to start Apache
    bf write "Starting Apache in foreground mode."
}

use bf

# Test Apache configuration
export def test [] {
    let ok = { bf write ok "Configuration OK." conf/test }
    { ^apachectl configtest } | bf handle -s $ok conf/test
}

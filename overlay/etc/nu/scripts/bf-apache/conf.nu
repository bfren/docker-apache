use bf

# Test Apache configuration
export def test [] { { ^apachectl configtest } | bf handle -s {|x| bf write ok "OK." conf/test } conf/test }

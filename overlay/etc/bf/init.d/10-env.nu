use bf
bf env load

# Set environment variables
def main [] {
    let etc = "/etc/apache2"
    bf env set APACHE_CONF $"($etc)/httpd.conf"
    bf env set APACHE_ETC $etc
    bf env set APACHE_ETC_HELPERS $"($etc)/helpers"
    bf env set APACHE_ETC_MODULES $"($etc)/modules"

    let sites = $"($etc)/sites"
    bf env set APACHE_ETC_SITES $sites
    bf env set APACHE_LOCALHOST_CONF $"($sites)/localhost.conf"

    let run = "/run/httpd"
    bf env set APACHE_RUN $"($run)"
    bf env set APACHE_PID $"($run)/httpd.pid"

    let www = "/www"
    bf env set APACHE_WWW $www
    bf env set APACHE_DOCROOT (bf env APACHE_DOCROOT_OVERRIDE $"($www)/htdocs")

    # return nothing
    return
}

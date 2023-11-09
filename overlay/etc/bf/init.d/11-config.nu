use bf
bf env load

# Generate Apache configuration
def main [] {
    # if custom configuration is enabled, return
    if (bf env check APACHE_USE_CUSTOM_CONF) {
        bf write "Apache custom configuration enabled."
        return
    }

    # generate configuration from template
    bf write "Generating Apache configuration."
    bf esh template $"(bf env APACHE_CONF)"
}

use bf
bf env load

# Ensure the htdocs directory exists
def main [] {
    let htdocs = $"(bf env APACHE_DOCROOT)"

    # if the directory already exists do nothing
    if ($htdocs | path exists) {
        bf write $"($htdocs) already exists."
        return
    }

    # $htdocs does not exist, so create it and copy the default index file
    bf write $"Creating ($htdocs)."
    mkdir $htdocs
    cp $"(bf env ETC_SRC)/index.html" $htdocs
    bf ch apply_file "11-apache-www"

    # return nothing
    return
}

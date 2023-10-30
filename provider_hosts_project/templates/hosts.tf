
resource "hosts_record" "myhost111" {
    address = "111.111.111.111"
    names   = [ "myhost111", "myhost111.local" ]
    comment = "server myhost111"
    notes   = "a first test-server"
}

resource "hosts_record" "myhost999" {
    address = "999.999.999.999"
    names   = [ "myhost999", "myhost999.local" ]
    comment = "server myhost999"
    notes   = "my lost server"
}

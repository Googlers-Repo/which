SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
/system/bin/which
/system/vendor/bin/which
/system/system_ext/bin/which
"

parse_color() {
    if [ "$MMRL" == "true" ]; then
        ui_print "$1"
    else
        ui_print ""
    fi
}

RESET=$(parse_color "\x1b[0m")
BLACK=$(parse_color "\x1b[30m") 
RED=$(parse_color "\x1b[31m")
GREEN=$(parse_color "\x1b[32m")
YELLOW=$(parse_color "\x1b[33m")
BLUE=$(parse_color "\x1b[34m")
MAGENTA=$(parse_color "\x1b[35m")
CYAN=$(parse_color "\x1b[36m")
WHITE=$(parse_color "\x1b[37m")
GRAY=$(parse_color "\x1b[90m")

print_modname() {
    ui_print "$RED          _     _      _     $RESET"
    ui_print "$RED         | |   (_)    | |    $RESET"
    ui_print "$RED__      _| |__  _  ___| |__  $RESET"
    ui_print "$RED\ \ /\ / / '_ \| |/ __| '_ \ $RESET"
    ui_print "$RED \ V  V /| | | | | (__| | | |$RESET"
    ui_print "$RED  \_/\_/ |_| |_|_|\___|_| |_|$RESET"                         
}


on_install() {
    ui_print "- Extracting module files"
    unzip -qq -o "$ZIPFILE" 'system/*' -d $MODPATH >&2

    [ -d "$MODPATH/system/bin/" ] || mkdir -p "$MODPATH/system/bin/"
}

set_permissions() {
    # DO NOT remove
    set_perm_recursive $MODPATH 0 0 0755 0644
    set_perm $MODPATH/system/bin/which 0 0 0755
    set_perm $MODPATH/system/vendor/bin/which 0 0 0755
    set_perm $MODPATH/system/system_ext/bin/which 0 0 0755
}
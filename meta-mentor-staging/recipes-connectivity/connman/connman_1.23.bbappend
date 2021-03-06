# Use PACKAGECONFIG handling for rdepends
RDEPENDS_${PN} = "dbus xuser-account"
PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi,,wpa-supplicant"
PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth,,bluez4"
PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono,,ofono"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://fix-stoping-interfaces-at-start.patch \
            file://connman.service \
            "
do_install_append() {
    cp -f ${WORKDIR}/connman.service ${D}${systemd_unitdir}/system/
}

do_install:append() {
	# Keep Weston running during headless boot, so HDMI/DP hotplug works later.
	if grep -q '^require-outputs=' ${D}${sysconfdir}/xdg/weston/weston.ini; then
		sed -i 's/^require-outputs=.*/require-outputs=none/' ${D}${sysconfdir}/xdg/weston/weston.ini
	else
		sed -i '/^\[core\]/a require-outputs=none' ${D}${sysconfdir}/xdg/weston/weston.ini
	fi
}

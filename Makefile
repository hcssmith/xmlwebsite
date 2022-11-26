.PHONY: serve serve-test

serve:
	lighttpd -D -f lighttpd.conf

serve-test:
	lighttpd -tt -f lighttpd.conf

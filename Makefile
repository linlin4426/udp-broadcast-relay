udp-broadcast-relay: main.c
	$(CC) $(CFLAGS) $(LDFLAGS) -Wall main.c -o udp-broadcast-relay

.PHONY: all
all: udp-broadcast-relay

.PHONY: clean
clean:
	-$(RM) *.o
	-$(RM) udp-broadcast-relay
	-$(RM) build-stamp

.PHONY: install
install: udp-broadcast-relay
	install -d $(DESTDIR)/usr/sbin
	install -d $(DESTDIR)/lib/systemd/system
	install -d $(DESTDIR)/etc/default
	install -m 0755 udp-broadcast-relay $(DESTDIR)/usr/sbin
	install -m 0644 udp-broadcast-relay@.service $(DESTDIR)/lib/systemd/system
	install -m 0644 udp-broadcast-relay.default $(DESTDIR)/etc/default/udp-broadcast-relay1

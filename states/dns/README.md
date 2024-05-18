# DNS State

CoreDNS is used to provide DNS services to the various devices on the home network.

This is used for both service discovery as well as for working around the fact that AT&T's fuckery makes relying on
MDNS a bad idea.

This state keeps most of its logic in init.sls.

Alexandria runs the primary DNS instance, with other nodes pointed at it.

In the future, this state will also provide standard /etc/hosts files based on data from pillar.

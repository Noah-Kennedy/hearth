# DNS State

CoreDNS is used to provide DNS services to the various devices on the home network.
This is used for both service discovery and for working around the fact that AT&T's fuckery makes relying on hostname
advertisements a bad idea.

One node (currently alexandria) runs the primary DNS instance and provides a unified cache to the cluster,
with other nodes running independent CoreDNS instances pointed at it.
This allows all nodes to still be able to contact each other in the event that the primary DNS server goes down,
while still benefiting from a unified cache and preventing all nodes from having to maintain a DNS cache,
which is critical when some of the Pis are quite resource-limited.

Host/IP mappings can be found in /pillar/metals, and DNS upstream and primary placement can be found in /pillar/dns.

Both Cloudflare and Google are used as upstreams to provide redundancy.

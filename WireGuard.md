WireGuard
=========

Server
------

```
[Interface]
Address = 192.168.101.1/24
ListenPort = 19001
DNS = 192.168.100.1
PrivateKey = GDGvWYnu3HsPiRr2u/Xt+7vghUJeFGrTlrfx484J9832c=
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o wlan0 -j MASQUERADE

[Peer]
PublicKey = Nip2ld+nmooPExMPwKxjLBQirhAVgp0kC/K/ShTI=
AllowedIPs = 192.168.101.2/32
```

Client
------

```
[Interface]
Address = 192.168.101.2/24
DNS = 8.8.4.4, 8.8.8.8
PrivateKey = 4G5DSf49p222fgNjjTh8oQ57fqDZ49NMBoLmzwHLRXC95+gIZFc=

[Peer]
AllowedIPs = 0.0.0.0/0
Endpoint = 94.21.222.114:19001
PersistentKeepalive = 5
PublicKey = 56Hgb)LPYxwtKDbo00xa4GH1LS8EB2v6CCDbr1vq8jc=
```

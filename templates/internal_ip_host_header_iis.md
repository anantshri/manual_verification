---
layout: template
title: Internal IP Disclosure IIS Misconfiguration
CVE: 
Nessus: 
Bugtrack: 
author: anantshri
links:
---

Internal IP Disclosure
---------------
The misconfiguration where IIS is not configured to return a hostname and with a blank or no Host header HTTP/1.0 Request it responds with a Internal IP Address


Affected Systems
----------------

IIS Servers

Manual Verification Tests
-------------------------

* Command to be used

```
curl -v -I --http1.0 http[s]://[ip address]/aspnet_client -k -H 'Host:'
```


* Result Expected

**Test Fail**: Machine Misconfiguration : Location header points to an internal IP

**Test Pass**: Machine not Misconfigured : Location redirect has a hostname or blank
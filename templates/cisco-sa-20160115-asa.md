---
layout: template
title: CISCO ASA 20160115 - Cisco ASA AnyConnect Client Authentication Attempt Handling Information Disclosure 
CVE: CVE-2016-1295
Nessus: 91963
Bugtrack: 
author: anantshri
links:
- https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160115-asa
---

CISCO ASA 20160115
---------------------

A vulnerability in the Cisco Adaptive Security Appliance (ASA) could allow an unauthenticated, remote attacker to access sensitive data, including the ASA Software version that is currently running on the appliance.

Affected Systems
----------------

All Cisco ASA hardware platforms are vulnerable when running Cisco ASA Software prior to a fixed release indicated in Cisco bug ID CSCuo65775

Manual Verification Tests
-------------------------

* Command to be used

```
curl -ssl -k -H "X-Aggregate-Auth:1" --data "TESTME" https://<IP>
```

* Result Expected

Response page containing CISCO ASA Version

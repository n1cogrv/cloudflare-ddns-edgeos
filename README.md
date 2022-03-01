# Cloudflare DDNS Script for EdgeOS

Designed for my Ubiquiti ER-X router to support dynamic domain update (ddns) on Cloudflare. 

## Usage

### 1 - Download

> Suppose you have already ssh into your EdgeOS based router, in my case, Ubiquiti ER-X.

#### 1.1 Using Github Raw

```bash
cd /config/scripts/ && pwd
# /config/scripts/

curl -LS -o /config/scripts/cloudflare-ddns-edgeos.tar.gz https://github.com/MijazzChan/cloudflare-ddns-edgeos/raw/releases/cloudflare-ddns-edgeos.tar.gz
```

#### 1.2 Trouble with GFW?

```bash
cd /config/scripts/ && pwd
# /config/scripts/

curl -LS -o /config/scripts/cloudflare-ddns-edgeos.tar.gz https://cdn.jsdelivr.net/gh/MijazzChan/cloudflare-ddns-edgeos@releases/cloudflare-ddns-edgeos.tar.gz
```

### 2 - Deploy

#### Extraction

```bash
tar -xvf /config/scripts/cloudflare-ddns-edgeos.tar.gz
```

#### Global Parameters Editing

**!!! This step is IMPORTANT !!!**

Alter variables in `/config/scripts/cloudflare-ddns-edgeos/cfddns.sh`

Meanings & where-can-be-found of global parameters is provided in `cfddns.sh` via code comments.

#### Extra Steps

`+x` to files using `chmod +x /config/scripts/cloudflare-ddns-edgeos/cfddns.sh`

### 3 - Test 

Before you set it as a scheduled task, execute it first. 
```bash
/config/scripts/cloudflare-ddns-edgeos/cfddns.sh
```
If it updates your domain record **both successfully and correctly**, proceed to next step. 

**Otherwise**, feel free to [open a issue](https://github.com/MijazzChan/cloudflare-ddns-edgeos/issues/new)

### 4 - Using `task-scheduler` to `cron` it

```bash
configure

set system task-scheduler task cloudflareddns executable path /config/scripts/cloudflare-ddns-edgeos/cfddns.sh
set system task-scheduler task cloudflareddns interval 20m

commit
save
exit
```

## About

EdgeOS somehow didn't support ddns on cloudflare, at least not an option in their web-ui. You need to configure it under cli.

Besides, it communicates with cloudflare through v1 api (currently v4 is actively supported & maintained by cf). 

Thus...this project.


## Release/Feature History

### v1.1

+ Automatically create dns record (No need to create record manually in advance).

+ Continuous-Delivery via `Github Action` is configured, build and push artifact to `releases` branch.

+ Documentation & comments update (following shell style guideline).

### v1.0-hotfix

+ Fix script import error. (MUST use absolute path to import `cloudflare-ddns`)

+ Update usage documentation.

### v1.0

+ Initial release, test passed on er-x.

## License

Copyright © 2022 MijazzChan <mijazz@qq.com>

This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

# Cloudflare DDNS Script for EdgeOS

It's originally designed for my Ubiquiti ER-X router to support dynamic domain update on Cloudflare. 

`cron` or `ppp-up` the script to achieve ddns.

## Scripts Usage

+ Alter specific section of `cfddns.sh`.

+ `chmod +x ./cfddns.sh`

+ try execute `./cfddns.sh`

## Using `edgeos`'s task-scheduler to cron

```bash
configure

set system task-scheduler task cloudflareddns executable path /config/scripts/cloudflare-ddns-edgeos/cfddns.sh
set system task-scheduler task cloudflareddns interval 20m

commit
save
exit
```


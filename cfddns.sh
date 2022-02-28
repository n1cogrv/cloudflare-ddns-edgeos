#!/bin/sh


# Import utility function here
# You `cloudflare-ddns` file ABSOLUTE PATH here!
. /config/scripts/cloudflare-ddns-edgeos/cloudflare-ddns

########
# Alter here
########

# Access Token generated from Cloudflare API token page
CF_ACCESS_TOKEN=""

# Can be seen from your zone page, bottom right Zone id
ZONE_IDENTIFIER=""

# You DNS record name, with A subdomain
RECORD_NAME=""


########
# Alter stops
########

main

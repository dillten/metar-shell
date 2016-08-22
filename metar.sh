#!/bin/bash
#!/bin/bash
if (( $# < 2 )); then
    printf "This command requires two inputs. A comma separated list of stations and the number of hours to retrieve."
    exit 1
fi
SITE=$1
HOURS=$2
curl -s https://aviationweather.gov/adds/dataserver_current/httpparam\?dataSource\=metars\&requestType\=retrieve\&format\=xml\&stationString\=$SITE\&hoursBeforeNow\=$HOURS\&fields\=raw_text | grep raw_text | sed -e 's,.*<raw_text>\([^<]*\)</raw_text>.*,\1,g'

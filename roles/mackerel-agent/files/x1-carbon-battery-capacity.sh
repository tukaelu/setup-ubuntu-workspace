#!/usr/bin/env bash
#
# [plugin.metrics.battery-capacity]
# command = "/path/to/x1-carbon-battery-capacity.sh"
#

LANG=C

if [ x$MACKEREL_AGENT_PLUGIN_META = x1 ]; then
    cat <<EOF
# mackerel-agent-plugin
{
  "graphs": {
    "battery": {
      "label": "X1 Carbon Battery capacity",
      "unit": "integer",
      "metrics": [
        { "name": "capacity", "label": "Battery capacity" }
      ]
    }
  }
}
EOF
    exit 0
fi

cap=$(cat /sys/class/power_supply/BAT0/capacity)
echo -n "battery.BAT0.capacity	${cap}	"
date +%s

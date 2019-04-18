#!/usr/bin/env bash
#
# [plugin.metrics.battery-energy]
# command = "/path/to/x1-carbon-battery-energy.sh"
#

LANG=C

if [ x$MACKEREL_AGENT_PLUGIN_META = x1 ]; then
    cat <<EOF
# mackerel-agent-plugin
{
  "graphs": {
    "battery": {
      "label": "X1 Carbon Battery energy",
      "unit": "integer",
      "metrics": [
        { "name": "full", "label": "Energy full" },
        { "name": "now", "label": "Energy now" },
      ]
    }
  }
}
EOF
    exit 0
fi

ef=$(cat /sys/class/power_supply/BAT0/energy_full)
en=$(cat /sys/class/power_supply/BAT0/energy_now)

echo -n "battery.BAT0.energy.full	${ef}	"
date +%s
echo -n "battery.BAT0.energy.now	${en}	"
date +%s

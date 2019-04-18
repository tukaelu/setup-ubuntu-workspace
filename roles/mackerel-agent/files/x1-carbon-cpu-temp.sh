#!/usr/bin/env bash
#
# [plugin.metrics.cpu-temp]
# command = "/path/to/x1-carbon-cpu-temp.sh"
#

LANG=C

if [ x$MACKEREL_AGENT_PLUGIN_META = x1 ]; then
    cat <<EOF
# mackerel-agent-plugin
{
  "graphs": {
    "battery": {
      "label": "X1 Carbon CPU temperature",
      "unit": "integer",
      "metrics": [
        { "name": "cpu", "label": "CPU" },
        { "name": "core0", "label": "Core 0" },
        { "name": "core1", "label": "Core 1" },
        { "name": "core2", "label": "Core 2" },
        { "name": "core3", "label": "Core 3" },
      ]
    }
  }
}
EOF
    exit 0
fi

cpu=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input | awk '{print $1 / 1000}')
core0=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp2_input | awk '{print $1 / 1000}')
core1=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp3_input | awk '{print $1 / 1000}')
core2=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp4_input | awk '{print $1 / 1000}')
core3=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp5_input | awk '{print $1 / 1000}')

echo -n "cpu.temp.cpu	${cpu}	"
date +%s
echo -n "cpu.temp.core0	${core0}	"
date +%s
echo -n "cpu.temp.core1	${core1}	"
date +%s
echo -n "cpu.temp.core2	${core2}	"
date +%s
echo -n "cpu.temp.core3	${core3}	"
date +%s

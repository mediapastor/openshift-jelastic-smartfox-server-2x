#!/bin/bash

SED=$(which sed);

#
# memory optimizer for smartfox server
#

SMARTFOX_CONTROL_SCRIPT="${OPENSHIFT_SFS_DIR}/versions/2.x/SmartFoxServer_2X/SFS2X/config/server.xml";

[ -z "$XMS" ] && { XMS=32; }
memory_total=`free -m | grep Mem | awk '{print $2}'`;
[ -z "$XMX" ] && { let XMX=memory_total-35;  }

$SED -i  "s/-Xms[0-9]*M/-Xms${XMS}M/g"  $SMARTFOX_CONTROL_SCRIPT;
$SED -i  "s/-Xmx[0-9]*M/-Xmx${XMX}M/g"  $SMARTFOX_CONTROL_SCRIPT;


#!/usr/bin/env python

import subprocess
import json

def ex(cmd):
    return subprocess.getoutput(cmd)


engineList = ex('ibus read-config | grep preload-engines | sed "s/preload-engines://g; s/\'/\\"/g"')
engineList = json.loads(engineList)

currentEngine = ex('ibus engine')
currentEngineIdx = engineList.index(currentEngine);

nextEngineIdx = currentEngineIdx+1;
if nextEngineIdx == len(engineList):
    nextEngineIdx=0

ex('ibus engine %s' % engineList[nextEngineIdx])

"""
A Python3 startup file.

Point the PYTHONSTARTUP env variable to this file,
and the python3 cmd will execute this file
when invoked into interactive mode.

"""
import sys

import re
import random as rand
from collections import deque
from io import StringIO
from io import BytesIO

import os
import os.path as osp
import subprocess as sub

dtformat = "%Y-%m-%d %H:%M:%S"
from datetime import datetime as dt
from datetime import timedelta as td
import time # time.sleep()


# instead set the PYTHONPATH environment variable
# mydata = os.environ.get("MYDATA", "/home/codeman/mydata")
# sys.path.append(osp.join(mydata, "git/ws/ws-misc-git/python/mylib"))

print("executed: ${MYDATA}/git/configs-git/python3/python-startup.py")



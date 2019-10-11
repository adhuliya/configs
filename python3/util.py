#!/usr/bin/env python3

# MIT License
# Copyright (c) 2019 Anshuman Dhuliya

"""Common utility functions module which can be used in any project.
Originalfile: $MYDATA/git/ws/ws-misc-git/python/mylib/util/common_util.py
Note: This file has been hard linked at many places.
"""

import os
import os.path as osp
from io import StringIO
from typing import Optional, List

import logging
_log = logging.getLogger(__name__)

globalCounter: int = 0

def create_dir(dirpath, exist_ok=True):
  """Creates dir. Relative paths use current directory.

  Args:
    dirpath: an absolute or relative path

  Returns:
    str: absolute path of the directory or None.
  """
  if osp.isabs(dirpath):
    abs_path = dirpath
  else:
    cwd = os.getcwd()
    abs_path = osp.join(cwd, dirpath)

  _log.debug("creating directory %s", abs_path)

  try:
    os.makedirs(abs_path, exist_ok=exist_ok)
  except Exception as e:
    _log.error("Error creating directory {},\n{}".format(abs_path, e))
    return None

  return abs_path

def getUniqueId() -> int:
  """Returns a unique integer id (increments by 1)."""
  # use of simple function and a global var is runtime efficient.
  global globalCounter
  globalCounter += 1
  return globalCounter

def readFromFile(fileName: str) -> str:
  """Returns the complete content of the given file."""
  with open(fileName) as f:
    return f.read()

def writeToFile(fileName: str, content: str):
  """Writes content to the given file."""
  with open(fileName, "w") as f:
    f.write(content)
  return None

def appendToFile(fileName: str, content: str):
  """Writes content to the given file."""
  with open(fileName, "a") as f:
    f.write(content)
  return None

def hexToFloat(hexVal) -> float:
  """Convert a float hex representation 0x41b80000 to a real float value"""
  import struct
  if isinstance(hexVal, str):
    return struct.unpack("!f", struct.pack("!i", int(hexVal, 16)))[0]
  elif isinstance(hexVal, int):
    return struct.unpack("!f", struct.pack("!i", hexVal))[0]

def hexToDouble(hexVal) -> float:
  """Convert a float hex representation 0x41b80000 to a real double value"""
  import struct
  if isinstance(hexVal, str):
    return struct.unpack("!d", struct.pack("!q", int(hexVal, 16)))[0]
  elif isinstance(hexVal, int):
    return struct.unpack("!d", struct.pack("!q", hexVal))[0]

def randomString(length: int = 10,
                 digits: bool = True,
                 caps: bool = True,
                 small: bool = True,
) -> Optional[str]:
  """Returns a random string of given length."""
  import random
  import string
  if not (digits or caps or small): return None

  randDigits = random.choices(string.digits, k=length)
  randCaps = random.choices(string.ascii_uppercase, k=length)
  randSmall = random.choices(string.ascii_lowercase, k=length)

  collect = []
  if digits:
    collect = randDigits
  if caps:
    collect.extend(randCaps)
  if small:
    collect.extend(randSmall)

  random.shuffle(collect)

  return "".join(collect[:length])

def getAllFilePaths(directory: str) -> List[str]:
  """Returns the full file names of all the files
  (recursively) withing the given directory."""
  filePathList = []
  for root, dirs, files in os.walk(directory):
    for d in dirs:
      path = osp.join(root, d)
      filePathList.append(path)
    for f in files:
      path = osp.join(root, f)
      filePathList.append(path)

  return filePathList


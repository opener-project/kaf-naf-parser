#!/usr/bin/env python

import sys, getopt, os

this_folder = os.path.dirname(os.path.realpath(__file__))

# This updates the load path to ensure that the local site-packages directory
# can be used to load packages (e.g. a locally installed copy of lxml).
sys.path.append(os.path.join(this_folder, 'site-packages/pre_install'))

from KafNafParser import KafNafParser

def main(argv):
  conversion = ""
  try:
    opts, args = getopt.getopt(argv,"hkn",["tokaf","tonaf"])
  except getopt.GetoptError:
    print 'could not parse options. Correct usage: \n\n kaf-naf-parser.py --tokaf --tonaf'
    sys.exit(2)
  for opt, arg in opts:
    if opt == '-h':
      print 'test.py --tokaf --tonaf'
      sys.exit()
    elif opt in ("-k", "--tokaf"):
      conversion = "to-kaf"
    elif opt in ("-n", "--tonaf"):
      conversion = "to-naf"

  if conversion == "":
    conversion = "kaf-naf"

  obj = KafNafParser(sys.stdin)

  if conversion == "to-kaf":
    obj.to_kaf()
  if conversion == "to-naf":
    obj.to_naf()

  obj.dump()

if __name__ == "__main__":
  main(sys.argv[1:])

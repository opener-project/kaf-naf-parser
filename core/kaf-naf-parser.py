#!/usr/bin/env python

from KafNafParserPy import KafNafParser
import sys, getopt

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

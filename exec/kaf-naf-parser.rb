#!/usr/bin/env ruby

require 'opener/daemons'
require_relative '../lib/opener/kaf_naf_parser'

options = Opener::Daemons::OptParser.parse!(ARGV)
daemon  = Opener::Daemons::Daemon.new(Opener::KafNafParser, options)

daemon.start
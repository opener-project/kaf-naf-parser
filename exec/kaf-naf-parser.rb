#!/usr/bin/env ruby

require 'opener/daemons'

require_relative '../lib/opener/kaf_naf_parser'

daemon = Opener::Daemons::Daemon.new(Opener::KafNafParser)

daemon.start

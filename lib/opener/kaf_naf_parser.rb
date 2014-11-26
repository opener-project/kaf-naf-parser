require 'open3'
require 'slop'

require_relative 'kaf_naf_parser/version'
require_relative 'kaf_naf_parser/cli'
require_relative 'kaf_naf_parser/server'

module Opener
  ##
  # Ruby wrapper around the Python based KafNafParser.
  #
  # @!attribute [r] options
  #  @return [Hash]
  #
  class KafNafParser
    attr_reader :options

    ##
    # Hash containing the default options to use.
    #
    # @return [Hash]
    #
    DEFAULT_OPTIONS = {
      :args       => [],
      :conversion => 'to-kaf'
    }.freeze

    ##
    # @param [Hash] options
    #
    # @option options [Array] :args Collection of arbitrary arguments to pass
    #  to the underlying kernel.
    #
    def initialize(options = {})
      @options = DEFAULT_OPTIONS.merge(options)
    end

    ##
    # Returns a String containing the command to use for executing the kernel.
    #
    # @return [String]
    #
    def command
      args = options[:args].join(' ')

      return "python -E #{kernel} #{args} #{conversion}"
    end

    ##
    # @return [String]
    #
    def conversion
      "--#{options[:conversion].gsub(/-/,'')}"
    end

    ##
    # Processes a given input KAF/NAF document and returns a new document in the
    # opposite format.
    #
    # @param [String] input
    # @return [String]
    #
    def run(input)
      stdout, stderr, process = capture(input)

      raise stderr unless process.success?

      return stdout
    end

    protected

    ##
    # capture3 method doesn't work properly with Jruby, so
    # this is a workaround
    #
    def capture(input)
      Open3.popen3(*command.split(" ")) {|i, o, e, t|
        out_reader = Thread.new { o.read }
        err_reader = Thread.new { e.read }
        i.write input
        i.close
        [out_reader.value, err_reader.value, t.value]
      }
    end

    ##
    # @return [String]
    #
    def core_dir
      return File.expand_path('../../../core', __FILE__)
    end

    ##
    # @return [String]
    #
    def kernel
      return File.join(core_dir, 'kaf-naf-parser.py')
    end
  end # KafNafParser
end # Opener

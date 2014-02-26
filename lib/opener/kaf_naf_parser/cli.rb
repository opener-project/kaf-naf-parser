module Opener
  class KafNafParser
    ##
    # CLI wrapper around {Opener::LanguageIdentifier} using OptionParser.
    #
    # @!attribute [r] options
    #  @return [Hash]
    # @!attribute [r] option_parser
    #  @return [OptionParser]
    #
    class CLI
      attr_reader :options, :option_parser

      ##
      # @param [Hash] options
      #
      def initialize(options = {})
        @options = DEFAULT_OPTIONS.merge(options)

        @option_parser = OptionParser.new do |opts|
          opts.program_name   = 'kaf-naf-parser'
          opts.summary_indent = '  '

          opts.on('-h', '--help', 'Shows this help message') do
            show_help
          end

          opts.on('-v', '--version', 'Shows the current version') do
            show_version
          end

          opts.on('-k', '--tokaf', 'Parses input to KAF') do
            @options[:conversion] = "to-kaf"
          end

          opts.on('-n', '--tonaf', 'Parses input to NAF') do
            @options[:conversion] = "to-naf"
          end

          opts.on('-l', '--log', 'Enable logging to STDERR') do
            @options[:logging] = true
          end

          opts.separator <<-EOF

Examples:

  cat example.kaf | #{opts.program_name} --tonaf    # Basic usage
  cat example.kaf | #{opts.program_name} --tonaf -l # Logs information to STDERR
          EOF
        end
      end

      ##
      # @param [String] input
      #
      def run(input)
        option_parser.parse!(options[:args])

        tagger = KafNafParser.new(options)

        stdout, stderr, process = tagger.run(input)

        if process.success?
          puts stdout

          if options[:logging] and !stderr.empty?
            STDERR.puts(stderr)
          end
        else
          abort stderr
        end
      end

      private

      ##
      # Shows the help message and exits the program.
      #
      def show_help
        abort option_parser.to_s
      end

      ##
      # Shows the version and exits the program.
      #
      def show_version
        abort "#{option_parser.program_name} v#{VERSION} on #{RUBY_DESCRIPTION}"
      end
    end # CLI
  end # KafNafParser
end # Opener

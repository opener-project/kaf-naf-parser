module Opener
  class KafNafParser
    ##
    # CLI wrapper around {Opener::KafNafParser} using Slop.
    #
    # @!attribute [r] parser
    #  @return [Slop]
    #
    class CLI
      attr_reader :parser

      def initialize
        @parser = configure_slop
      end

      ##
      # @param [Array] argv
      #
      def run(argv = ARGV)
        parser.parse(argv)
      end

      ##
      # @return [Slop]
      #
      def configure_slop
        return Slop.new(:strict => false, :indent => 2, :help => true) do
          banner 'Usage: kaf-naf-parser [OPTIONS]'

          separator <<-EOF.chomp

About:

    Component for converting KAF documents to NAF documents and vice-versa.
    This command reads input from STDIN.

Example:

    cat some_file.kaf | kaf-naf-parser --tonaf
          EOF

          separator "\nOptions:\n"

          on :v, :version, 'Shows the current version' do
            abort "kaf-naf-parser v#{VERSION} on #{RUBY_DESCRIPTION}"
          end

          on :k, :tokaf, 'Converts NAF to KAF'
          on :n, :tonaf, 'Converts KAF to NAF'

          run do |opts, args|
            conversion = opts[:tonaf] ? 'to-naf' : 'to-kaf'
            parser     = KafNafParser.new(
              :args       => args,
              :conversion => conversion
            )

            input = STDIN.tty? ? nil : STDIN.read

            puts parser.run(input)
          end
        end
      end
    end # CLI
  end # KafNafParser
end # Opener

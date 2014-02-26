Feature: Using files as input and output
  In order to tag the polarity
  Using a file as an input
  Using a file as an output

  Scenario Outline: Tokenize the text
    Given the fixture file "<input_file>"
    And I convert to "<conversion>"
    Then the output should match the fixture "<output_file>"
  Examples:
    | input_file | output_file | conversion |
    | input.kaf  | output.naf  | to-naf     |
    | input.naf  | output.kaf  | to-kaf     |

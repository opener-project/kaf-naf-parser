Introduction
------------

This library converts KAF to NAF and NAF to KAF. It also contains a webservice
for doing exactly this.

It uses slightly altered distributions of the VUA_pylib and KafNafParserPy but
it keeps the external libraries contained, so that shouldn't influence anything
on your system.

### Confused by some terminology?

This software is part of a larger collection of natural language processing
tools known as "the OpeNER project". You can find more information about the
project at [the OpeNER portal](http://opener-project.github.io). There you can
also find references to terms like KAF (an XML standard to represent linguistic
annotations in texts), component, cores, scenario's and pipelines.

Quick Use Example
-----------------

Installing the kaf-naf-parser can be done by executing:

    gem install opener-kaf-naf-parser

Please bare in mind that all components in OpeNER take KAF as an input and
output KAF by default.

It ships with 3 command line tools and a webservice:

    kaf-to-naf
    naf-to-kaf
    kaf-naf-parser
    kaf-naf-parser-server

It works like this:

    cat some_kaf.kaf | kaf-to-naf > output.naf
    cat some_naf.naf | naf-to-kaf > output.kaf

    cat some_kaf.kaf | kaf-naf-parser --tonaf > output.naf

The webservice can be started like this:

    naf-to-kaf-parser-server

And can then be accessed at: <http://localhost:9292>

Easiest way to install the gem:

    gem install opener-kaf-naf-parser

### Daemon

Last but not least the kaf-naf-parser comes shipped with a daemon that can read
jobs (and write) jobs to and from Amazon SQS queues. For more information type:

    kaf-naf-parser-daemon -h

Description of dependencies
---------------------------

This component runs best if you run it in an environment suited for OpeNER
components. You can find an installation guide and helper tools in the
[OpeNER installer](https://github.com/opener-project/opener-installer) and an
[installation guide on the Opener Website](http://opener-project.github.io/getting-started/how-to/local-installation.html).

At least you need the following system setup:

### Dependencies for normal use:

* Ruby 1.9.3 or newer
* Python 2.6

Where to go from here
---------------------

* [Check the project website](http://opener-project.github.io)
* [Checkout the webservice](http://opener.olery.com/kaf-naf-parser)

Report problem/Get help
-----------------------

If you encounter problems, please email support@opener-project.eu or leave an
issue in the
[issue tracker](https://github.com/opener-project/kaf-naf-parser/issues).

Contributing
------------

1. Fork it <http://github.com/opener-project/kaf-naf-parser/fork>
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

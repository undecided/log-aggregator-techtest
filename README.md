# LogAggregator

## Purpose

The log aggregator exists to count path entries in a simplified server access log.

Expected inputs (as a text file):
```
/some/path 1.2.3.4
/other/uri 1.2.3.4
/other/uri 4.3.2.1
```

Ultimately, the purpose of this log aggregator is as a coding test.


## Things I've done differently

 - the provided log is in spec/fixtures/webserver.log
 - the log file has added entries, just to ensure that I handle error cases gracefully
 - I have purposefully over-engineered this solution. Feel free to explore the git history.

For example, as a tool for my own purposes, I might have stopped at
[the version at this commit](https://github.com/undecided/log-aggregator-techtest/blob/a8df80ae31e68944c2db1e6d2846151766231a94/lib/log_aggregator.rb)

## Things I didn't get time for:

 - rubocop / standardrb - normally would, not sure why I didn't this time
 - fix the pluralisation of "views" in the output
 - replacing missing values with graceful messages
 - accepting log entries via a pipe or other stdin redirect
 - colour coding the output
 - check handling of special codepage files (UTF-8 should work fine in most rubies)

## Important design decisions:

 - Strictly no inheritance. Composition instead. I wouldn't usually be this strict.
 - 3-line methods - with some small exceptions. This is relatively normal for me.
 - named method params unless obvious: again, something I tend to be quite strict on.

## Ruby version support

 I have checked this with Ruby 2.4 and 3.0.1, so most installations should have no trouble.

## Installation

To run this without installing it, check out the repository and from the main directory:

    $ bundle install
    $ ./exe/log_aggregator spec/fixtures/webserver.log

To install this as an application, build the gem and then install it:

    $ gem build log_aggregator.gemspec
    $ gem install ./log_aggregator-0.1.0.gem

If your path is set up correctly, you should be able to execute the program with:

    $ log_aggregator spec/fixtures/webserver.log


## Usage

To aggregate only based on path, use:

    $ log_aggregator path/to/webserver.log

However, to tally each IP address visiting a given page only once, use:

    $ log_aggregator --unique path/to/webserver.log

## Contributing

This is a tech test, so I think contributing would be technically cheating.

However, I look forward to the opportunity to pair on this at some point!


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

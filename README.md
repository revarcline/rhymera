# Rhymera

Rhymera is a CLI gem to search the [RhymeBrain](https://rhymebrain.com) API for rhymes and portmanteaus of a given query. Menus give you the option to start a new search with the result, look through previous searches, or copy a result to the clipboard.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rhymera'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rhymera

## Usage

Execute `rhymera`. After searching a query and choosing which type of search to conduct, you can find more information about each result in the menus.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/revarcline/rhymera.

## License

Licensed under GPL 3.0, See LICENSE for details.

[![Build Status](https://travis-ci.org/TiteiKo/tax_manipulator.svg?branch=master)](https://travis-ci.org/TiteiKo/tax_manipulator)

# TaxManipulator

2014, France. Taxes go up from 19.6% to 20% on the 1st of January.

I then changed the class we used to compute prices (taxes amount and without taxes prices)
to be able to compute it depending on the date.

Today, I think it's finally time for me to cleanup and open source this bit of code !

## Installation

TaxManipulator requires **ruby >= 2.1** as it takes advantages of named parameters.

Add this line to your application's Gemfile:

```ruby
gem 'tax_manipulator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tax_manipulator

## Usage

config/initializers/tax_manipulator.rb

```ruby
TaxManipulator.configure do |config|
  config.add_rate rate: 19.6, ending: Date.parse('2013-12-31')
  config.add_rate rate: 2.0, starting: Date.parse('2014-01-01')

  # optional: default scheme for the price given (:incl_tax or :excl_tax)
  config.default_scheme :incl_tax
end
```

Examples:

```ruby
# if you have your price including tax
TaxManipulator.for(42, scheme: :incl_tax).price_excl_tax
TaxManipulator.for(42, scheme: :incl_tax).vat
TaxManipulator.for(42, scheme: :incl_tax, date: Date.parse('2013-12-10')).vat

# if you have your price excluding tax
TaxManipulator.for(42, scheme: :excl_tax).price_incl_tax
TaxManipulator.for(42, scheme: :excl_tax).vat
TaxManipulator.for(42, scheme: :excl_tax, date: Date.parse('2013-12-10')).vat

# if the default scheme is set
TaxManipulator.for(42).vat
TaxManipulator.for(42, date: Date.parse('2013-12-10')).vat
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt
that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/TiteiKo/tax_manipulator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run the tests and write your owns (`bundle exec rake`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

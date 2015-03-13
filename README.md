# Tok

No-frills token-based authentication for modern Rails applications.

## Installation

Tok works with (and is tested against) Rails > 4.0. To install, add this line to your application's Gemfile:

```ruby
gem 'tok'
```

Then run `bundle install`. You can always install the gem yourself by executing:

    $ gem install tok

## Usage

First, run the generator by executing:

    $ rails generate tok:install

The generator by default does the following:

- Inserts `Tok::Authentication` into `User` model (or creates one if not available)
- Inserts `Tok::Controller` into your `ApplicationController`
- Creates an initializer at `config/initializers/tok.rb` to allow further configuration

A custom model can be specified (whether existing or to be created) by passing `--model` (or just `-m`) as an option to the generator as follows:

    $ rails generate tok:install -m Account
    $ rails generate tok:install --model=Account

In this case, the generator will also create a migration in order to create a table with the specified model pluralized.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tok/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

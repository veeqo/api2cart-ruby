# Api2cart

Ruby client for [API2Cart](https://www.api2cart.com/) with proxy support, fully covered with tests.
The DSL is similar to DSL of [original gem](https://rubygems.org/gems/API2Cart) therefore migration is easy.


## Installation

Add this line to your application's Gemfile:

    gem 'api2cart-ruby', require: 'api2cart'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api2cart-ruby

## Usage

```ruby
Api2cart::Store.new(api_key, store_key).product_count
# => { 'products_count' => 76 }
```


Sponsored by [Veeqo](https://github.com/veeqo)

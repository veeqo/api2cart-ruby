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

With proxy:

```ruby
Api2cart::Store.new(api_key, store_key, proxy: 'http://anti-throttling-proxy.local:1080').product_count
# => { 'products_count' => 76 }
```

## Configuration

```ruby
Api2cart.configure do |c|
  c.host = 'custom.example.com' # default is 'api.api2cart.com'
  c.api_version = '1.1'         # default is '1.0'
end
```

## Contributors

* [Anton Pershakov](https://github.com/main24)
* [Daniel Vartanov](https://github.com/DanielVartanov)
* [Tom Procter](https://github.com/TDProcter)

Sponsored by [Veeqo](https://github.com/veeqo)

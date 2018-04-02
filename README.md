# ip2country
Ruby library for ip2country API

## Installation

```shell
gem install ip2country
```
or in Gemfile

```shell
gem 'ip2country', :git => 'git://github.com/developer-vivacity/ip2country.git'

```


## Usage

```ruby
require 'ip2country'

ip2countryapi = IP2COUNTRY::V1.new('5.6.7.8')
puts ip2countryapi.info

```

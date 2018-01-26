# SupportBee

Ruby client to work with SupportBee API (https://developers.supportbee.com/api)

## Installation

```Bash
gem 'supportbee', github: 'apoex/supportbee'
```

## Usage

```ruby
require 'supportbee'

sb = SupportBee::Client.new(:company => 'my_company', :auth_token => 'my_auth_token')

tickets = sb.tickets

```

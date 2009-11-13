#!/usr/bin/env ruby

require 'upcase'
require 'reverse'
require 'all_header'

use Rack::ContentLength
use AllHeader
use Upcase
use Reverse

app = lambda { |env|
  [ 200,
    { 'Content-Type' => 'text/html' },
    Time.now.to_s
  ]
}

run app

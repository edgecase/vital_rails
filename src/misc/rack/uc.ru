#!/usr/bin/env ruby

require 'upcase'
require 'reverse'

use Upcase
use Reverse
use Rack::ContentLength

app = lambda { |env|
  [ 200,
    { 'Content-Type' => 'text/html' },
    "<html><head></head><body><h1>#{Time.now.to_s}</h1></body></html>"
  ]
}

run app

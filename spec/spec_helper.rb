ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require 'rspec/rails'
require 'drift'

require_relative '../app/models/drift/blog_post'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end

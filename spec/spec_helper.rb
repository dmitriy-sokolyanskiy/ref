require 'simplecov'
require 'undercover'
require 'i18n'
require 'pry-byebug'

SimpleCov.start do
  add_filter(%r{\/spec\/})
end

require_relative '../dependencies'
Dir[Dir.pwd + '/entities/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

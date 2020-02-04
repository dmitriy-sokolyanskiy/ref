require 'yaml'
require 'i18n'
require 'pry-byebug'

require_relative 'config/i18n'
require_relative 'entities/console'

I18n.config.load_path << Dir[File.expand_path('config/locales') + '/*.yml']

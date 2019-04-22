# frozen_string_literal: true

require 'English'
require 'yaml'
require 'json'
require 'sequel'
require 'faker'
require 'net/scp'
require 'shellwords'

# Root directory
ROOT_DIR = File.dirname File.expand_path __FILE__
print ROOT_DIR
print ''

LOG_DIR = ROOT_DIR + '/log'
print LOG_DIR
print ''

APP_DIR = ROOT_DIR + '/lib/anonymizer'
print APP_DIR
print ''

# Load models
Dir[APP_DIR + '/model/**/*.rb'].each { |file| require file }

# Additional helpers
Dir[APP_DIR + '/helper/*.rb'].each { |file| require file }

env = ENV['RUBY_ENV'] || 'development'

CONFIG = YAML.load_file("config/env/#{env}.yml")
print CONFIG

Dir.mkdir(LOG_DIR) unless File.exist?(LOG_DIR)
Dir.mkdir(CONFIG['tmp_path']) unless File.exist?(CONFIG['tmp_path'])

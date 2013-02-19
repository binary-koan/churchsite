require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
if ENV['OPENSHIFT_MONGODB_DB_HOST'] and ENV['OPENSHIFT_MONGODB_DB_PORT']
  ENV['MONGODB_URI'] ||= ENV['OPENSHIFT_MONGODB_DB_HOST'] + ':' + ENV['OPENSHIFT_MONGODB_DB_PORT']
end

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

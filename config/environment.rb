# Load the Rails application.
require_relative "application"

git_token = File.join(Rails.root, 'config', 'set_github_token.rb')
load(git_token) if File.exist?(git_token)

# Initialize the Rails application.
Rails.application.initialize!

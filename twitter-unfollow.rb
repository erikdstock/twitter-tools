# frozen_string_literal: true

# Original source: https://github.com/KrauseFx/twitter-unfollow
require 'twitter'
require 'shellwords'
require 'dotenv'

Dotenv.load

REQUIRED_ENV = %w[TWITTER_CONSUMER_KEY TWITTER_CONSUMER_SECRET TWITTER_ACCESS_TOKEN TWITTER_ACCESS_TOKEN_SECRET].freeze
missing_env = REQUIRED_ENV.reject { |val| ENV[val] }
raise("Missing required ENV values: #{missing_env.join(', ')}") if missing_env.any?

class Unfollow
  def run
    raise "Please create a list called 'Old Follows'" if old_follows_list.nil?

    followings = client.following

    followings.each do |user|
      next if user.screen_name == 'KrauseFx' # trolololol

      puts "Unfollowing user #{user.screen_name} (#{user.name})"
      client.add_list_member(old_follows_list, user.id)
      client.unfollow(user.id)
      `echo "#{user.screen_name.shellescape}" >> unfollowed_usernames.txt`
      `echo "#{user.screen_name.shellescape} (#{user.name.shellescape}): #{user.description.shellescape}" >> unfollowed_full_names.txt`
      sleep 1
    end
  end

  def old_follows_list
    @_old_follows_list ||= client.lists.find { |a| a.name == 'Old Follows' }
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
end

Unfollow.new.run

# coding: utf-8
require 'twitter'
require 'pit'
include ActionView::Helpers::TextHelper

class VimCommand < ActiveRecord::Base
  attr_accessible :command, :description, :mode_id, :language
  belongs_to :mode
  default_scope order: 'vim_commands.id'
  
  def self.update_tweet(lang, skip_interval, tweets_per_exec, ex_show_interval)
    if execute_this_time? skip_interval.to_i
      execute lang, tweets_per_exec.to_i, ex_show_interval.to_i
    else
      puts "Skip this time"
    end
  end

  def self.execute_this_time?(skip_interval)
    Time.now.hour % skip_interval == 0
  end

  def self.show_ex_command?(ex_show_interval)
    Time.now.hour % ex_show_interval == 0
  end

  def self.execute(lang, tweets_per_exec, ex_show_interval)
    configure_twitter lang
    commands = show_ex_command?(ex_show_interval) ? all_commands(lang) : non_ex_commands(lang)
    count = commands.count
    tweets_per_exec.times do
      idx = rand(count)
      command = VimCommand.find commands[idx].id
      tweet = build_tweet command
      post tweet
    end
  end

  def self.all_commands(lang)
    VimCommand.where(language: lang).select('id')
  end

  def self.non_ex_commands(lang)
    VimCommand.where(language: lang).joins(:mode).where("modes.label NOT LIKE 'EX%'").select('vim_commands.id')
  end

  def self.configure_twitter(lang)
    pit = Pit.get(
        "be_vimmer_#{lang}",
        :require => {
            "twitter.consumer_key.#{lang}"       => '',
            "twitter.consumer_secret.#{lang}"    => '',
            "twitter.oauth_token.#{lang}"        => '',
            "twitter.oauth_token_secret.#{lang}" => '',
        })

    pit["twitter.consumer_key.#{lang}"]       ||= ENV["twitter.consumer_key.#{lang}"]
    pit["twitter.consumer_secret.#{lang}"]    ||= ENV["twitter.consumer_secret.#{lang}"]
    pit["twitter.oauth_token.#{lang}"]        ||= ENV["twitter.oauth_token.#{lang}"]
    pit["twitter.oauth_token_secret.#{lang}"] ||= ENV["twitter.oauth_token_secret.#{lang}"]

    Twitter.configure do |config|
      config.consumer_key       = pit["twitter.consumer_key.#{lang}"]
      config.consumer_secret    = pit["twitter.consumer_secret.#{lang}"]
      config.oauth_token        = pit["twitter.oauth_token.#{lang}"]
      config.oauth_token_secret = pit["twitter.oauth_token_secret.#{lang}"]
    end
  end

  def self.build_tweet(command)
    tweet = "#{command.command} → #{command.description} [#{command.mode.label}]"
    length = 140 - " #Vim".size - 1
    truncate(tweet, length: length) + " #Vim"
  end

  def self.post(tweet)
    puts tweet
    begin
      Twitter.update tweet.chomp
    rescue => ex
      p ex
    end
  end
end

# coding: utf-8
require 'twitter'
include ActionView::Helpers::TextHelper

class VimCommand < ActiveRecord::Base
  attr_accessible :command, :description, :mode_id, :language
  belongs_to :mode
  default_scope order: 'vim_commands.id'
  
  def self.update_tweets(lang, skip_interval, tweets_per_exec, ex_show_interval)
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
    commands = show_ex_command?(ex_show_interval) ? all_commands(lang) : non_ex_commands(lang)
    count = commands.count
    tweets_per_exec.times do
      idx = rand(count)
      command = VimCommand.find commands[idx].id
      tweet = build_tweet command
      post tweet, lang
    end
  end

  def self.all_commands(lang)
    VimCommand.where(language: lang).select('id')
  end

  def self.non_ex_commands(lang)
    VimCommand.where(language: lang).joins(:mode).where("modes.label NOT LIKE 'EX%'").select('vim_commands.id')
  end

  def self.build_tweet(command)
    tweet = "#{command.command} → #{command.description} [#{command.mode.label}]"
    length = 140 - " #Vim".size - 1
    truncate(tweet, length: length) + " #Vim"
  end

  def self.post(tweet, lang)
    puts tweet
    begin
      twitter_client(lang).update tweet.chomp
    rescue => ex
      p ex
    end
  end

  def self.twitter_client(lang)
    params = {
        consumer_key:       ENV["twitter_consumer_key_#{lang}"],
        consumer_secret:    ENV["twitter_consumer_secret_#{lang}"],
        oauth_token:        ENV["twitter_oauth_token_#{lang}"],
        oauth_token_secret: ENV["twitter_oauth_token_secret_#{lang}"]
    }

    raise "Please check env values!" if params.values.any?(&:nil?)

    Twitter::Client.new(params)
  end
end

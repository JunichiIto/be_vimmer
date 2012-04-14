# encoding: UTF-8
require 'twitter'
require 'pit'
namespace :cron do
  desc "Random tweets"
  task :random_tweets => :environment do
    pit = Pit.get(
      'be_vimmer_jp',
      :require => {
        'twitter.consumer_key'       => ENV["twitter.consumer_key"],
        'twitter.consumer_secret'    => ENV["twitter.consumer_secret"],
        'twitter.oauth_token'        => ENV["twitter.oauth_token"],
        'twitter.oauth_token_secret' => ENV["twitter.oauth_token_secret"],
    })
    pit["twitter.consumer_key"] ||= ENV["twitter.consumer_key"]
    pit["twitter.consumer_secret"] ||= ENV["twitter.consumer_secret"]
    pit["twitter.oauth_token"] ||= ENV["twitter.oauth_token"]
    pit["twitter.oauth_token_secret"] ||= ENV["twitter.oauth_token_secret"]
    p pit
    Twitter.configure do |config|
      config.consumer_key       = pit["twitter.consumer_key"]
      config.consumer_secret    = pit["twitter.consumer_secret"]
      config.oauth_token        = pit["twitter.oauth_token"]
      config.oauth_token_secret = pit["twitter.oauth_token_secret"]
    end
    count = VimCommand.count
    3.times do 
      id = rand(count)
      command = VimCommand.find id
      tweet = build_tweet command
      puts tweet
      update tweet
    end
  end

  def build_tweet(command)
    "#{command.command} → #{command.description} [#{command.mode.label}] #Vim"
  end

  def update(tweet)
    return nil unless tweet

    begin
      Twitter.update(tweet.chomp)
    rescue => ex
      #nil # todo
      p ex
    end
  end
end

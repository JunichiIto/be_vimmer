# encoding: UTF-8
require 'twitter'
require 'pit'
include ActionView::Helpers::TextHelper
desc "Random tweets"
task :cron, "lang"
task :cron => :environment do |x, args|
  lang = args.lang
  configure lang
  commands = VimCommand.where(language: lang).select('id')
  count = commands.count
  3.times do 
    idx = rand(count)
    command = VimCommand.find commands[idx].id
    tweet = build_tweet command
    puts tweet
    update tweet
  end
end

def configure(lang)
  pit = Pit.get(
    "be_vimmer_#{lang}",
    :require => {
      "twitter.consumer_key.#{lang}"       => '', 
      "twitter.consumer_secret.#{lang}"    => '', 
      "twitter.oauth_token.#{lang}"        => '', 
      "twitter.oauth_token_secret.#{lang}" => '', 
  })
  pit["twitter.consumer_key.#{lang}"] ||= ENV["twitter.consumer_key.#{lang}"]
  pit["twitter.consumer_secret.#{lang}"] ||= ENV["twitter.consumer_secret.#{lang}"]
  pit["twitter.oauth_token.#{lang}"] ||= ENV["twitter.oauth_token.#{lang}"]
  pit["twitter.oauth_token_secret.#{lang}"] ||= ENV["twitter.oauth_token_secret.#{lang}"]

  Twitter.configure do |config|
    config.consumer_key       = pit["twitter.consumer_key.#{lang}"]
    config.consumer_secret    = pit["twitter.consumer_secret.#{lang}"]
    config.oauth_token        = pit["twitter.oauth_token.#{lang}"]
    config.oauth_token_secret = pit["twitter.oauth_token_secret.#{lang}"]
  end
end

def build_tweet(command)
  tweet = "#{command.command} → #{command.description} [#{command.mode.label}]"
  truncate(tweet, length: 140-" #Vim".size-1) + " #Vim"
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

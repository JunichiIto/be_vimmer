# encoding: UTF-8
require 'twitter'
require 'pit'
include ActionView::Helpers::TextHelper

desc "Random tweets"

task :cron, "lang", "skip_interval", "tweets_per_exec", "ex_show_interval"
task :cron => :environment do |x, args|
  if execute_this_time? args.skip_interval.to_i
    execute args.lang, args.tweets_per_exec.to_i, args.ex_show_interval.to_i
  else
    puts "Skip this time"
  end
end

def execute_this_time?(skip_interval)
  Time.now.hour % skip_interval == 0 
end

def show_ex_command?(ex_show_interval)
  Time.now.hour % ex_show_interval == 0 
end

def execute(lang, tweets_per_exec, ex_show_interval)
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

def all_commands(lang)
  VimCommand.where(language: lang).select('id')
end

def non_ex_commands(lang)
  VimCommand.where(language: lang).joins(:mode).where("modes.label NOT LIKE 'EX%'").select('vim_commands.id')
end

def configure_twitter(lang)
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

def build_tweet(command)
  tweet = "#{command.command} → #{command.description} [#{command.mode.label}]"
  length = 140 - " #Vim".size - 1
  truncate(tweet, length: length) + " #Vim"
end

def post(tweet)
  puts tweet
  begin
    Twitter.update tweet.chomp
  rescue => ex
    p ex
  end
end

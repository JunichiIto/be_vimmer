require 'csv'
require 'twitter'

class VimCommand
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attribute :mode, :string
  attribute :language, :string
  attribute :command, :string
  attribute :description, :string

  LANGUAGES = %w(cn en jp tw).freeze

  class << self
    def load_from_csv(lang)
      return [] unless LANGUAGES.include?(lang)
      path = Rails.root.join("doc/csv/#{lang}.csv")
      CSV.foreach(path, headers: true).map do |row|
        params = {
          mode: row['mode'],
          language: row['language'],
          command: row['command'],
          description: row['description'],
        }
        new(params)
      end
    end

    def update_tweets(lang, skip_interval, tweets_per_exec, ex_show_interval)
      if execute_this_time? skip_interval.to_i
        execute lang, tweets_per_exec.to_i, ex_show_interval.to_i
      else
        puts "Skip this time"
      end
    end

    private

    def execute_this_time?(skip_interval)
      Time.now.hour % skip_interval == 0
    end

    def show_ex_command?(ex_show_interval)
      Time.now.hour % ex_show_interval == 0
    end

    def execute(lang, tweets_per_exec, ex_show_interval)
      commands = show_ex_command?(ex_show_interval) ? all_commands(lang) : non_ex_commands(lang)
      commands.sample(tweets_per_exec).each do |command|
        tweet = build_tweet command
        post tweet, lang
      end
    end

    def all_commands(lang)
      load_from_csv(lang)
    end

    def non_ex_commands(lang)
      load_from_csv(lang).reject { |record| record.mode.start_with?('EX') }
    end

    def build_tweet(command)
      tweet = "#{command.command} → #{command.description} [#{command.mode}]"
      max_length = command.language == 'en' ? 280 : 140
      length = max_length - " #Vim".size - 1
      tweet.truncate(length) + " #Vim"
    end

    def post(tweet, lang)
      puts tweet
      begin
        # twitter_client(lang).update tweet.chomp
      rescue => ex
        p ex
        puts ex.backtrace.join("\n")
      end
    end

    def twitter_client(lang)
      params = {
        consumer_key:        Settings["twitter_consumer_key_#{lang}"],
        consumer_secret:     Settings["twitter_consumer_secret_#{lang}"],
        access_token:        Settings["twitter_oauth_token_#{lang}"],
        access_token_secret: Settings["twitter_oauth_token_secret_#{lang}"]
      }

      raise "Please check env values or settings.local.yml!" if params.values.any?(&:nil?)

      Twitter::REST::Client.new(params)
    end
  end
end

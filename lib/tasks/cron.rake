desc "Random tweets"
task :cron, "lang", "skip_interval", "tweets_per_exec", "ex_show_interval"
task :cron => :environment do |x, args|
  VimCommand.update_tweet(args.lang, args.skip_interval, args.tweets_per_exec, args.ex_show_interval)
end

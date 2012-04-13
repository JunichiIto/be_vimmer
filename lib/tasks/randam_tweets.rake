namespace :cron do
  desc "Randam tweet"
  task :randam_tweets => :environment do
    count = VimCommand.count
    3.times do 
      id = rand(count)
      command = VimCommand.find id
      p command
    end
  end
end

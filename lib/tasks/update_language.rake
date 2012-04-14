namespace :seed do
  desc "Update language column"
  task :update_language => :environment do
    VimCommand.update_all("language = 'jp'")
  end
end

namespace :seed do
  desc "Update current jp to jp_old"
  task :update_current_jp => :environment do
    VimCommand.update_all("language = 'jp_old'", "language = 'jp'")
  end
end

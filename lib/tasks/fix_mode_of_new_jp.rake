# encoding: UTF-8
namespace :seed do
  desc "Fix mode of new Japanese"
  task :fix_mode_of_new_jp => :environment do
    mode = Mode.where(label: "ファイル編集").first_or_create!
    #VimCommand.update_all("mode_id = #{mode.id}", "id between 3937 and 3944")
    VimCommand.update_all("mode_id = #{mode.id}", "id between 5368 and 5375")
  end
end


class ChangeModeId < ActiveRecord::Migration
  def up
    #http://stackoverflow.com/questions/8503156/altered-my-database-structure-in-development-so-tried-to-reset-heroku-deployed
    remove_index :vim_commands, [:language, :mode_id, :command]
    rename_column :vim_commands, :mode_id, :old_mode_id
    add_column :vim_commands, :mode_id, :integer
    VimCommand.reset_column_information
    VimCommand.each {|e| e.update_attribute(:mode_id, e.old_mode_id.to_i) }
    remove_column :vim_commands, :old_mode_id
    add_index :vim_commands, [:language, :mode_id, :command], unique: true, name: "idx_l_m_c"
  end

  def down
    raise IrreversibleMigration
  end
end

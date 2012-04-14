class UpdateIndexToVimCommands < ActiveRecord::Migration
  def change
    remove_index :vim_commands, [:mode_id, :command]
    add_index :vim_commands, [:language, :mode_id, :command]
  end
end

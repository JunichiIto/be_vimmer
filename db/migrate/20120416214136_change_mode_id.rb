class ChangeModeId < ActiveRecord::Migration
  def up
    remove_index :vim_commands, [:language, :mode_id, :command]
    change_column :vim_commands, :mode_id, :integer
    add_index :vim_commands, [:language, :mode_id, :command], unique: true, name: "idx_l_m_c"
  end

  def down
    #However, string type is not valid
    remove_index :vim_commands, [:language, :mode_id, :command]
    change_column :vim_commands, :mode_id, :string
    add_index :vim_commands, [:language, :mode_id, :command], unique: true
  end
end

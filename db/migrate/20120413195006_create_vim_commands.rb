class CreateVimCommands < ActiveRecord::Migration
  def change
    create_table :vim_commands do |t|
      t.string :mode_id
      t.string :command
      t.string :description

      t.timestamps
    end
    add_index :vim_commands, [:mode_id, :command], :unique
  end
end

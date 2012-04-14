class AddLanguageToVimCommands < ActiveRecord::Migration
  def change
    add_column :vim_commands, :language, :string
  end
end

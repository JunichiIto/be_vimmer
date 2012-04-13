class CreateModes < ActiveRecord::Migration
  def change
    create_table :modes do |t|
      t.string :label

      t.timestamps
    end
  end
end

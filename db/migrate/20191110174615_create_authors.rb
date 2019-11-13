class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :full_name, null: false

      t.timestamps
    end
    add_index :authors, :full_name, unique: true
  end
end

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login_name
      t.boolean :is_books_admin
      t.boolean :is_group_admin

      t.timestamps
    end
  end
end

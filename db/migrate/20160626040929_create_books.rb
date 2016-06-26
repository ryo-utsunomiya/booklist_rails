class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :rate, null: false, default: 0

      t.timestamps
    end
  end
end

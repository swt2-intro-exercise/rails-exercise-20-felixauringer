class CreatePapers < ActiveRecord::Migration[6.0]
  def change
    create_table :papers do |t|
      t.string :title, null: false
      t.string :venue
      t.integer :year, null: false

      t.timestamps
    end
  end
end

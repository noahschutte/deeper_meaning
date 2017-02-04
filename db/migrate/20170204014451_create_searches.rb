class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :word, null: false

      t.timestamps
    end
  end
end

class CreateStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :statements do |t|
      t.integer :NISTControlID
      t.string :number
      t.longtext :description

      t.timestamps
    end
  end
end

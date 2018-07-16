class CreateSubstatements < ActiveRecord::Migration[5.2]
  def change
    create_table :substatements do |t|
      t.integer :StatementID
      t.string :number
      t.text :description

      t.timestamps
    end
  end
end

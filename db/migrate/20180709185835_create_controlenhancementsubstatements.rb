class CreateControlenhancementsubstatements < ActiveRecord::Migration[5.2]
  def change
    create_table :controlenhancementsubstatements do |t|
      t.integer :controlenhancementstatement_id
      t.string :number
      t.text :description

      t.timestamps
    end
  end
end

class CreateControlenhancementstatements < ActiveRecord::Migration[5.2]
  def change
    create_table :controlenhancementstatements do |t|
      t.integer :controlenhancement_id
      t.string :number
      t.text :description

      t.timestamps
    end
  end
end

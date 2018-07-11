class CreateControls < ActiveRecord::Migration[5.2]
  def change
    create_table :controls do |t|
      t.text :title
      t.text :description
      t.text :publisher

      t.timestamps
    end
  end
end

class CreateNistcontrols < ActiveRecord::Migration[5.2]
  def change
    create_table :nistcontrols do |t|
      t.text :family
      t.text :number
      t.text :title
      t.text :priority
      t.text :basestatement
      t.text :withdrawn

      t.timestamps
    end
  end
end

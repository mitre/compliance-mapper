class CreateIacontrols < ActiveRecord::Migration[5.2]
  def change
    create_table :iacontrols do |t|
      t.string :nistcontrolnumber
      t.string :controlSubjectArea
      t.string :impact
      t.string :name
      t.longtext :description
      t.string :number

      t.timestamps
    end
  end
end

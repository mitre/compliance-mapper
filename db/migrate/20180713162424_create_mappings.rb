class CreateMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :mappings do |t|

      t.timestamps
    end
  end
end

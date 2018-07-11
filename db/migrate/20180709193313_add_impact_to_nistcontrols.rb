class AddImpactToNistcontrols < ActiveRecord::Migration[5.2]
  def change
    add_column :nistcontrols, :impact, :text
    add_column :nistcontrols, :SGdescription, :text
    add_column :nistcontrols, :SGrelated, :text
  end
end

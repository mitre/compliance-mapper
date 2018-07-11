class FixNistControlId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :statements, :NISTControlID, :nistcontrol_id
  	rename_column :substatements, :StatementID, :statement_id
  end
end

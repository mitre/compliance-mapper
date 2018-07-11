class Substatement < ApplicationRecord
	belongs_to :statement, :inverse_of => :substatements
end

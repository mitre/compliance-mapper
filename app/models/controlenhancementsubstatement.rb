class Controlenhancementsubstatement < ApplicationRecord
	belongs_to :controlenhancementstatement, :inverse_of => :controlenhancementsubstatements
end

class Controlenhancementstatement < ApplicationRecord
	has_many :controlenhancementsubstatements
	belongs_to :controlenhancement, :inverse_of => :controlenhancementstatements
	accepts_nested_attributes_for :controlenhancementsubstatements
end

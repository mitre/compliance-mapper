class Controlenhancement < ApplicationRecord
	has_many :controlenhancementstatements
	belongs_to :nistcontrol, :inverse_of => :controlenhancements
	accepts_nested_attributes_for :controlenhancementstatements
end

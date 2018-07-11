class Statement < ApplicationRecord
	belongs_to :nistcontrol, :inverse_of => :statements
	has_many :substatements
	accepts_nested_attributes_for :substatements
end

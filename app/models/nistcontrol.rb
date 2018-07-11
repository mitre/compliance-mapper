class Nistcontrol < ApplicationRecord
	has_many :statements
	has_many :controlenhancements
	accepts_nested_attributes_for :statements
	accepts_nested_attributes_for :controlenhancements
end

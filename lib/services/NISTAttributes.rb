require 'happymapper'


#p controls_xml
module Services
class SubStatement
	include HappyMapper
	tag 'statement'

	element :number, String, tag: 'number'
	element :description, String, tag: 'description'
end

class Statement
	include HappyMapper
	tag 'statement'

	element :number, String, tag: 'number'
	element :description, String, tag: 'description'
	has_many :substatements, SubStatement, tag: 'statement'

end

class Statements
	include HappyMapper
	tag 'statement'

	element :description, String, tag: 'description'
	has_many :statement, Statement, tag: 'statement', xpath: '.'
end

class SupplementalGuidance
	include HappyMapper
	tag 'supplemental-guidance'

	element :description, String, tag: 'description'
	has_many :related, String, tag: 'related'

	def relatedcontrols
		@related.join(',')
	end
end

class Reference
	include HappyMapper
	tag 'reference'

	element :item, String, tag: 'item'
end

class Withdrawn
	include HappyMapper
	tag 'withdrawn'

	has_many :incorporateds, String, tag: 'incorporated-into'

	def incorporatedinto
		@incorporateds.join(', ')
	end
end



class References
	include HappyMapper
	tag 'references'

	has_many :reference, Reference, tag: 'reference'
end

class ControlEnhancement
	include HappyMapper
	tag 'control-enhancement'

	element :number, String, tag: 'number'
	element :title, String, tag: 'title'
	element :withdrawn, Withdrawn, tag: 'withdrawn'
	has_many :impacts, String, tag: 'baseline-impact'
	def impact
		@impacts.join('\n')
	end
	element :statements, Statements, tag: 'statement'
	element :supplementalguidance, SupplementalGuidance, tag: 'supplemental-guidance'
end

class ControlEnhancements
	include HappyMapper
	tag 'control-enhancements'

	has_many :controlenhancement, ControlEnhancement, tag: 'control-enhancement'
end



class Control
	include HappyMapper
	tag 'control'

	element :family, String, tag: 'family'
	element :number, String, tag: 'number'
	element :title, String, tag: 'title'
	element :withdrawn, Withdrawn, tag: 'withdrawn', xpath: '.'
	element :priority, String, tag: 'priority' 
	has_many :impacts, String, tag: 'baseline-impact'

	def impact
		@impacts.join('\n')
	end

	has_one :statements, Statements, tag: 'statement'
	element :supplementalguidance, SupplementalGuidance, tag: 'supplemental-guidance'
	has_one :references, References, tag: 'references'
	has_one :controlenhancements, ControlEnhancements, tag: 'control-enhancements'

end

class Controls 
	include HappyMapper
	tag 'controls'

	has_many :control, Control, tag: 'control'
end

end

#controls_xml = File.read('.../800-53-controls.xml')
#cont = Controls.parse(controls_xml)

require 'roo-xls'
module Services
	class IAControl
		attr_accessor :id
		attr_accessor :name
		attr_accessor :desc
		attr_accessor :mapping
	   def initialize(id, name, desc)
	      @id = id
	      @name = name
	      @desc = desc
	   end
	end
	class IAControlParser
		attr_accessor :iacontrolarray
		xlsx = Spreadsheet.open 'data/DIACAPtoNIST'
		sheet = xlsx.worksheet 0
		iacontrolarray = []
		sheet.each do |row|
			if !row[0].nil?
				temp = IAControl.new(row[0], row[1], row[2])
				if row[29] != nil
					if row[29].index(':') != nil
					# p row[0] 
					# p row[29][row[29].index(':')+1..-1].strip.split(',')
					temp.mapping = row[29][row[29].index(':')+1..-1].strip.split(',')
					#p temp.id + ": " + temp.mapping.join(',')
					iacontrolarray << temp
					end
				end
				#p "hello".index('l')
			else
				next
			end
			#p row[0] unless row[0].nil?
		end

		def controls 
			iacontrolarray
		end

		# def self.controls
		# 	iacontrolarray
		# end
		#iacontrolarray
	end
end


#p iacontrolarray[2].instance_variable_get(:@name)

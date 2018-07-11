# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'services/NISTAttributes'


Control.create(title: '800-53 NIST Controls', description: "NIST Special Publication 800-53 provides a catalog of security controls for all U.S. federal information systems except those related to national security. It is published by the National Institute of Standards and Technology, which is a non-regulatory agency of the United States Department of Commerce. NIST develops and issues standards, guidelines, and other publications to assist federal agencies in implementing the Federal Information Security Management Act of 2002 (FISMA) and to help with managing cost effective programs to protect their information and information systems.", publisher: "NIST")
Control.create(title: '8500.2 IA Controls', description: "An objective DoDI 8500.2 IA condition of integrity, availability, or confidentiality achieved through the application of specific safeguards or through the regulation of specific activities that is expressed in a specified format (i.e., a control number, a control name, control text, and a control class). Specific management, personnel, operational, and technical controls are applied to each DoD information system to achieve an appropriate level of integrity, availability, and confidentiality in accordance with OMB Circular A-130 (reference (v)).", publisher: "DoDI")
#Nistcontrol.create(family: "ACCESS CONTROL" , number: "AC-3" , title: "ACCESS ENFORCEMENT", priority: "P1" , basestatement: "The information system enforces approved authorizations for logical access to information           and system resources in accordance with applicable access control policies." , withdrawn: "False")


## Use same code to parse through the 800-50 control file and then for each one, do the thing

nist_controls_xml = File.read('data/800-53-controls.xml')
nist_controls = Services::Controls.parse(nist_controls_xml)

nist_controls.control.each do |nist_control|
	controlFamily = nist_control.family
	controlNumber = nist_control.number
	controlTitle = nist_control.title
	controlWithdrawn = nist_control.withdrawn != nil ? nist_control.withdrawn.incorporatedinto : "N/A"
	controlPriority = nist_control.priority
	controlImpacts = nist_control.impact 
	controlBaseDescription = nist_control.statements.description
	controlSupplementalGuidanceDescription = nist_control.supplementalguidance != nil ? nist_control.supplementalguidance.description : "N/A"
	controlSupplementalGuidanceRelated = nist_control.supplementalguidance != nil ? nist_control.supplementalguidance.relatedcontrols : "N/A"
	nistControl = Nistcontrol.create(family: controlFamily, 
									 number: controlNumber, 
									 title: controlTitle, 
									 priority: controlPriority, 
									 basestatement: controlBaseDescription, 
									 withdrawn: controlWithdrawn, 
									 impact: controlImpacts, 
									 SGdescription: controlSupplementalGuidanceDescription,
									 SGrelated: controlSupplementalGuidanceRelated)
	p "nistID: #{nistControl.id}"
	if(nist_control.statements.statement != nil)
		controlstatement = ''
		controlStatements = nist_control.statements.statement
		controlStatements.each do |statement|
			controlStatement = {
				statement_params: {}
			}
			controlStatement[:statement_params][:number] = statement.number
			controlStatement[:statement_params][:description] = statement.description
			controlstatement = nistControl.statements.create(controlStatement[:statement_params])
			#p "		statementID:  #{controlstatement.id}"
			if(statement.substatements != nil)
				controlSubStatements = statement.substatements
				controlSubStatements.each do |substatement|
					controlSubStatement = {
						substatement_params: {}
					}
					controlSubStatement[:substatement_params][:number] = substatement.number
					controlSubStatement[:substatement_params][:description] = substatement.description
					controlsubstatement = controlstatement.substatements.create(controlSubStatement[:substatement_params])
					#p "			substatementID: #{controlsubstatement.id}"
				end
			end
		end
	end

	if(nist_control.controlenhancements != nil)
		nist_control.controlenhancements.controlenhancement.each do |enhancement|
			#CREATE CONTROL ENHANCEMENT OBJECT HERE
			controlEnhancement = {
				enhancement_params: {}
			}
			controlEnhancement[:enhancement_params][:number] = enhancement.number
			controlEnhancement[:enhancement_params][:title] = enhancement.title
			controlEnhancement[:enhancement_params][:baselineimpact] = enhancement.impacts != nil ? enhancement.impact : "N/A"
			controlEnhancement[:enhancement_params][:baseControlEnhancementDescription] = enhancement.statements.description
			controlEnhancement[:enhancement_params][:withdrawn]	!= nil ? enhancement.withdrawn.incorporatedinto : "N/A"
			controlEnhancement[:enhancement_params][:SGdesc] = enhancement.supplementalguidance != nil ? enhancement.supplementalguidance.description : "N/A"
			controlEnhancement[:enhancement_params][:SGrelated] = enhancement.supplementalguidance != nil ? enhancement.supplementalguidance.relatedcontrols : "N/A"
			controlenhancement = nistControl.controlenhancements.create(controlEnhancement[:enhancement_params])
			p "		CE_ID: #{controlenhancement.number}"
			if(enhancement.statements != nil)
				enhancement.statements.statement.each do |statement|
					# CREATE CONTROL ENHANCEMENT STATEMENTS HERE
					controlEnhancementStatement = {
						statement_params: {} 
					}
					controlEnhancementStatement[:statement_params][:number] = statement.number
					controlEnhancementStatement[:statement_params][:description] = statement.description
					controlenhancementstatement = controlenhancement.controlenhancementstatements.create(controlEnhancementStatement[:statement_params])
					#p nist_control.number + ": " + statement.number
					p "			CEStatement_ID: #{controlenhancementstatement.number}"
					if(statement.substatements != nil)
						statement.substatements.each do |substatement|
							# CREATE CONTROL ENHANCEMENT SUBSTATEMENTS HERE
							controlEnhancementSubStatement = {
								substatement_params: {}
							}
							controlEnhancementSubStatement[:substatement_params][:number] = substatement.number
							controlEnhancementSubStatement[:substatement_params][:description] = substatement.description
							controlenhancementsubstatement = controlenhancementstatement.controlenhancementsubstatements.create(controlEnhancementSubStatement[:substatement_params])
							p "				CESubStatement_ID: #{controlenhancementsubstatement.number}"

						end
					end
				end
			end
		end
	end



end







# nist_controls.control.each do |nist_control|
# 	statementnums = []
# 	statementdesc = []
# 	substatementnums = []
# 	substatementdesc = []
# 	nist_control.statements.statement.each do |statement|
# 		statementnums << statement.number
# 		statementdesc << statement.description
# 		statement.substatements.each do |substatement|
# 			substatementnums << substatement.number
# 			substatementdesc << substatement.description
# 		end
# 	end
# 	nistcontrol = Nistcontrol.create(family: nist_control.family , number: nist_control.number , title: nist_control.title , priority: nist_control.priority, basestatement: nist_control.statements.description, withdrawn: nist_withdrawn,
# 		basestatementdesc: basestatementdesc, statementnums: statementnums.join(","), statementdesc: statementdesc.join("|"), substatementnums: substatementnums.join(","), 
# 		substatementdesc: substatementdesc.join("|"), SGdesc: sgdesc, 
# 		SGrelated: sgrelated)
# end

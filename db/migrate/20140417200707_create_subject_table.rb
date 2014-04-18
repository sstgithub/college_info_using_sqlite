class CreateSubjectTable < ActiveRecord::Migration
  def change
  	create_table 	:subjects do |s|
  		s.string		:name
  		s.string		:department
  	end
  end
end

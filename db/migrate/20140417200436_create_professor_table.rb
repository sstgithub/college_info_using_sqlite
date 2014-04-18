class CreateProfessorTable < ActiveRecord::Migration
  def change
  	create_table 	:professors do |p|
  		p.string 		:name
  		p.date 			:date
  		p.integer		:years_exp
 			p.boolean		:PhD, default: true
  		p.timestamps # => created_at updated_at
  	end
  end
end
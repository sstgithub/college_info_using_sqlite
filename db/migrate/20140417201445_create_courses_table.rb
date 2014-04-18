class CreateCoursesTable < ActiveRecord::Migration
  def change
  	create_table 	:courses do |c|
  		c.integer		:level
  		c.date			:start_date
  		c.integer		:professor_id
  		c.integer		:subject_id
  	end
  end
end

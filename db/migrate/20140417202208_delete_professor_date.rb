class DeleteProfessorDate < ActiveRecord::Migration
  def change
  	remove_column :professors, :date, :date
  end
end

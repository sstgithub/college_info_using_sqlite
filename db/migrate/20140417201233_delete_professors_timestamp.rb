class DeleteProfessorsTimestamp < ActiveRecord::Migration
  def change
  	remove_column :professors, :created_at, :datetime
  	remove_column :professors, :updated_at, :datetime
  end
end

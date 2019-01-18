class AddRecruiterToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :recruiter, foreign_key: true
  end
end

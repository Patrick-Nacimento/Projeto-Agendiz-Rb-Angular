class AddGroupToInterns < ActiveRecord::Migration[5.2]
  def change
    add_reference :interns, :group, foreign_key: true
  end
end

class CreateInterns < ActiveRecord::Migration[5.2]
  def change
    create_table :interns do |t|
      t.string :description
      t.integer :age
      t.string :telephone
      t.string :quality
      t.string :defect

      t.timestamps
    end
  end
end

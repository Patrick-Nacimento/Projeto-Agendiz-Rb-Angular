class CreateRecruiters < ActiveRecord::Migration[5.2]
  def change
    create_table :recruiters do |t|
      t.string :description
      t.string :cnpj
      t.string :telephone

      t.timestamps
    end
  end
end

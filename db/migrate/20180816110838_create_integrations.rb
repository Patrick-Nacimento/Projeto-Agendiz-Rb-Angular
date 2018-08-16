class CreateIntegrations < ActiveRecord::Migration[5.2]
  def change
    create_table :integrations do |t|
      t.string :name, index: true, null: false
      t.string :auth_key, index: true, null: false

      t.references :created_by, index: true, foreign_key: {to_table: :users}
      t.references :updated_by, index: true, foreign_key: {to_table: :users}

      t.boolean :active, index: true, default: true
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end

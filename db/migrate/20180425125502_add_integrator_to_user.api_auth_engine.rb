# This migration comes from api_auth_engine (originally 20150810121206)
class AddIntegratorToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :integrator, :boolean, index: true, null: false, default: false
  end
end

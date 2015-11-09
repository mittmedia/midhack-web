class AddApiKeysToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :overview_api_key, :string
  end
end

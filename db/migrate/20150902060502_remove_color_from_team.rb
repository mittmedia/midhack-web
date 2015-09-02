class RemoveColorFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :color, :string
  end
end

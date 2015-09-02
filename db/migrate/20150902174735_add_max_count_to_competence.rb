class AddMaxCountToCompetence < ActiveRecord::Migration
  def change
    add_column :competences, :max_count, :integer, default: 0
  end
end

class AddStepToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :step, :integer
  end
end

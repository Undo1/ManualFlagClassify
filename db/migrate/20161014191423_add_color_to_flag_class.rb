class AddColorToFlagClass < ActiveRecord::Migration[5.0]
  def change
    add_column :flag_classes, :color, :string
  end
end

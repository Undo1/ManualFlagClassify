class AddHasManyToFlags < ActiveRecord::Migration[5.0]
  def change
    add_reference :flags, :flag_class, foreign_key: true
  end
end

class CreateFlagClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :flag_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end

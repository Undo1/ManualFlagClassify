class CreateFlags < ActiveRecord::Migration[5.0]
  def change
    create_table :flags do |t|
      t.boolean :result
      t.string :result_reason
      t.string :flag_text

      t.timestamps
    end
  end
end

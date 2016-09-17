class CreateConfigElements < ActiveRecord::Migration
  def change
    create_table :config_elements do |t|
      t.string :key
      t.string :value

      t.timestamps null: false
    end
  end
end

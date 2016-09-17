class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :step_number
      t.integer :kind
      t.string :selector
      t.text :script_code
      t.text :response
      t.boolean :store_datalayer
      t.text :datalayer
      t.references :case_test, index: true

      t.timestamps null: false
    end

    add_attachment :steps, :screenshot
  end
end

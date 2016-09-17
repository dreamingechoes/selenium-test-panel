class CreateCaseTests < ActiveRecord::Migration
  def change
    create_table :case_tests do |t|
      t.string :title
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end

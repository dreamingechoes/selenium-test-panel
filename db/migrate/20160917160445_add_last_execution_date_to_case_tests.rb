class AddLastExecutionDateToCaseTests < ActiveRecord::Migration
  def change
    add_column :case_tests, :last_execution, :datetime
  end
end

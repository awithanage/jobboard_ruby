class AddJobclosedateToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :jobclosedate, :date
  end
end

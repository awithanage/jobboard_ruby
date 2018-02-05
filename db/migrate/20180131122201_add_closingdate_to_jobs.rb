class AddClosingdateToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :closingdate, :datetime
  end
end

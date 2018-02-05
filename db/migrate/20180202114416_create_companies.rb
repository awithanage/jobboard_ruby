class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :c_name
      t.text :c_description

      t.timestamps
    end
  end
end

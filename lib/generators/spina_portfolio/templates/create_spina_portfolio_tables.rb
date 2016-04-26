class CreateSpinaPortfolioTables < ActiveRecord::Migration
  def change
    create_table :spina_case_studies do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.belongs_to :spina_client, index: true
      t.timestamps
    end

    create_table :spina_clients do |t|
      t.string :name
      t.string :employee_name
      t.text :employee_title
      t.timestamps
    end
  end
end

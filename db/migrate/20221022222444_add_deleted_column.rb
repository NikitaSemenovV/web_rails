class AddDeletedColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :deleted, :boolean, default: false
    add_column :geeks, :deleted, :boolean, default: false
    add_column :applies, :deleted, :boolean, default: false
    add_column :companies, :deleted, :boolean, default: false
  end
end

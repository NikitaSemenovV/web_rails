class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.integer :job_id
      t.integer :geek_id
      t.boolean :read, :default => false
      t.boolean :invited, :default => false

      t.timestamps
    end
  end
end

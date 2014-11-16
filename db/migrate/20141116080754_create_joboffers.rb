class CreateJoboffers < ActiveRecord::Migration
  def self.up
    create_table :joboffers do |t|
      t.string :title
      t.date :date
      t.string :city
      t.text :details
      t.timestamps
    end
  end

  def self.down
  drop_table :joboffers
  end
end

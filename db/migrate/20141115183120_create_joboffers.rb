class CreateJoboffers < ActiveRecord::Migration
  def self.up
  create_table :joboffers do |j|
  j.string :title
  j.date :date
  j.string :city
  j.text :details
  j.timestamps
  end
  end
  def self.down
  drop_table :joboffers
  end
end

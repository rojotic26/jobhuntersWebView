class CreateJoboffers < ActiveRecord::Migration
  def self.up
  create_table :joboffers do |j|
  end
  end
  def self.down
  drop_table :joboffers
  end
end

class CreateJoboffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.string :title
      t.date :date
      t.string :city
      t.text :details
      t.timestamps
    end
  end

  def self.down
  drop_table :offers
  end
end

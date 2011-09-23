class CreateLotterySources < ActiveRecord::Migration
  def change
    create_table :lottery_sources do |t|
      t.string :name

      t.timestamps
    end
  end
end

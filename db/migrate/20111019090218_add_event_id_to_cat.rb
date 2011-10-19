class AddEventIdToCat < ActiveRecord::Migration
  def change
    add_column :cats, :event_id, :integer
  end
end

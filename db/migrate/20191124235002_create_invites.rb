class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.integer :attendee_id
      t.integer :attendee_event_id

      t.timestamps
    end
  end
end

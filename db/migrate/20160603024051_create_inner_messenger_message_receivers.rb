class CreateInnerMessengerMessageReceivers < ActiveRecord::Migration[5.0]
  def change
    create_table :inner_messenger_message_receivers do |t|
      t.references :message, foreign_key: true
      t.integer :receiver_id
      t.integer :state

      t.timestamps
    end
  end
end

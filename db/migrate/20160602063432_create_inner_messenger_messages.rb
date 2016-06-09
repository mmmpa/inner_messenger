class CreateInnerMessengerMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :inner_messenger_messages do |t|
      t.string :owner_id, null: false
      t.text :title, null: true
      t.text :body, null: false

      t.timestamps
    end
  end
end

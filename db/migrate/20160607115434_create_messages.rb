class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :account, index: true
      t.boolean :read, :default => false
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps
    end
  end
end

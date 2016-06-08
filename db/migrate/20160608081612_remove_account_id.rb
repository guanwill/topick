class RemoveAccountId < ActiveRecord::Migration
  def change
    remove_column :messages, :account_id;
  end
end

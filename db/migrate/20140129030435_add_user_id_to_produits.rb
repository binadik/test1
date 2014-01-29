class AddUserIdToProduits < ActiveRecord::Migration
  def change
    add_column :produits, :user_id, :integer
    add_index :produits, :user_id
  end
end

class FixColumnsOnFavourites < ActiveRecord::Migration
  def change
    rename_column :favourites, :answer_id_id, :answer_id
    rename_column :favourites, :user_id_id, :user_id
  end
end

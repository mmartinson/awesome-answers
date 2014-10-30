class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.references :answer_id, index: true
      t.references :user_id, index: true

      t.timestamps
    end
  end
end

class CreateFavorite < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :restaurant_id
    end
  end
end

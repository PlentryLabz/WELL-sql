class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pic
      t.string :first_name
      t.string :second_name
      t.string :vk_link
      t.string :twitter_link
      t.string :instagram_link
      t.string :about
      t.date :birth_date
      t.integer :city_id

      t.timestamps
    end

    add_index :users, :city_id
  end
end
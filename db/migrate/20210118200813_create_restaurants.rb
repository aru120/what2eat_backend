class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :yelpid
      t.string :image
      t.string :name
      t.string :categories, array: true, default:[]

      t.timestamps
    end
  end
end

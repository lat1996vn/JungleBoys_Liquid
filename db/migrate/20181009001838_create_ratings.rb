class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references:comment,     foreign_key: true,  null: false
      t.references:room,     foreign_key: true,  null: false
      t.integer:stars,                            null: false
    end
  end
end

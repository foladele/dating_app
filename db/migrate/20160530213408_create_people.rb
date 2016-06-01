class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

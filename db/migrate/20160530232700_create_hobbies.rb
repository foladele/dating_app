class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
      t.string :description
      t.belongs_to :person

      t.timestamps null: false
    end
  end
end

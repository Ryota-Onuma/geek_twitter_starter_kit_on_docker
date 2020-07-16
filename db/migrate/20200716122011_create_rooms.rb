class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :user_id
      t.boolean :important
      t.boolean :check

      t.timestamps
    end
  end
end

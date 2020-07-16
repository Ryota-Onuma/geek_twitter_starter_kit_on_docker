class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :user_id
      t.text :text
      t.timestamps
    end
  end
end
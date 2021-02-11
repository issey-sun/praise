class CreatePLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :p_likes do |t|
      t.references :user,         foreign_key: true
      t.references :p_answer,     foreign_key: true
      t.references :p_definition, foreign_key: true
      t.timestamps
    end
  end
end

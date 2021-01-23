class CreatePReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :p_reviews do |t|
      t.string :content
      t.integer :score
      t.references :user,       foreign_key: true
      t.references :p_definition, foreign_key: true
      t.timestamps
    end
  end
end

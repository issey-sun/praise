class CreateDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :definitions do |t|
      t.text       :title,          null: false
      t.text       :body,           null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end

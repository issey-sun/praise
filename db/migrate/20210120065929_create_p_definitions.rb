class CreatePDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :p_definitions do |t|
      t.text       :title,          null: false
      t.text       :body,           null: false
      t.date       :definition_day
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end

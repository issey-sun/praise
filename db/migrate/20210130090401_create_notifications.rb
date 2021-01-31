class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :visitor, foreign_key:{ to_table: :users }, null: false
      t.references :visited, foreign_key:{ to_table: :users }, null: false
      
      t.references :definition, foreign_key: true
      t.references :p_definition, foreign_key: true
      
      t.references :answer, foreign_key: true
      t.references :p_answer, foreign_key: true
      
      t.string :action, null: false
      # actionで通知の種類を分類
      t.boolean :checked, null: false, default: false
      # checkedで未読、既読を識別

      t.timestamps
    end
  end
end

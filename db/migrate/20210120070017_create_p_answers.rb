class CreatePAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :p_answers do |t|
      t.text       :answer,     null: false
      t.date       :answer_day
      t.references :user,       foreign_key: true
      t.references :p_definition, foreign_key: true
      t.timestamps
    end
  end
end

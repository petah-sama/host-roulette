class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.references :guest, foreign_key: true
      t.boolean :content, null: false

      t.timestamps
    end
  end
end

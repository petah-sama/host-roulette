class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :edition, foreign_key: true
      t.string :content, null:false

      t.timestamps
    end
  end
end

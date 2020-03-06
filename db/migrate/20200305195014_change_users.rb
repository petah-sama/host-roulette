class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :date_of_birth, :date, order: %i(day month year)
  end
end

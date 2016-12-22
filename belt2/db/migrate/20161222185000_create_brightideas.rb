class CreateBrightideas < ActiveRecord::Migration
  def change
    create_table :brightideas do |t|
      t.text :idea
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

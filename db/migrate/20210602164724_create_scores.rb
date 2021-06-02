class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :total, default: 0
      t.text :description

      t.timestamps
    end
  end
end

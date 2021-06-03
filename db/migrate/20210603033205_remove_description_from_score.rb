class RemoveDescriptionFromScore < ActiveRecord::Migration[6.0]
  def change
    remove_column :scores, :description, :text
  end
end

class AddPdfEnabledToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :pdf_enabled, :boolean, default: false
  end
end

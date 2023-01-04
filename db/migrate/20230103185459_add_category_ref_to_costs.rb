class AddCategoryRefToCosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :costs, :category, null: false, foreign_key: true, index: true
  end
end

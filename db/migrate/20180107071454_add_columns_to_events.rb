class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :image2, :string
    add_column :events, :image3, :string
    add_column :events, :image4, :string
    add_column :events, :image5, :string
    add_column :events, :image6, :string
    add_column :events, :image7, :string
    add_column :events, :image8, :string
    add_column :events, :image9, :string
  end
end

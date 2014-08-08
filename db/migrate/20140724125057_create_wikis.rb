class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :body
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
  end
end

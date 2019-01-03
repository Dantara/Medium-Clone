class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.belongs_to :user, index: true
      t.boolean :done, default: false

      t.timestamps
    end
  end
end

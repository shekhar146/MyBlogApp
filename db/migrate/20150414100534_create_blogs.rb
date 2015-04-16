class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :subject
      t.text :content
      t.string :tag

      t.timestamps null: false
    end
  end
end

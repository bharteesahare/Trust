class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :name
      t.text :description
      t.references :project, foreign_key: true
      t.references :story_category, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :slug
      t.text :body_fr
      t.text :body_en
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

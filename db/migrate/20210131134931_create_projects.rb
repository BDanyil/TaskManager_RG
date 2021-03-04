class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :user, foreign_key: true, index: false

      t.timestamps
    end
  end
end

class AddDescriptionToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :description, :string, null: false
  end
end

class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :relative_path
      t.text :description

      t.timestamps null: false
    end
  end
end

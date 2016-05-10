class CreateArifs < ActiveRecord::Migration
  def change
    create_table :arifs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

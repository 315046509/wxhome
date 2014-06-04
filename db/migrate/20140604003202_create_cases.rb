class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :title
      t.string :content
      t.attachment :avatar

      t.timestamps
    end
  end
end

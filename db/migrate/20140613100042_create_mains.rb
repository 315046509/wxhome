class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
      t.string :name
      t.string :tel
      t.string :address

      t.timestamps
    end
  end
end

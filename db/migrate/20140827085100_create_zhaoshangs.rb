class CreateZhaoshangs < ActiveRecord::Migration
  def change
    create_table :zhaoshangs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

class CreateJournalisms < ActiveRecord::Migration
  def change
    create_table :journalisms do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

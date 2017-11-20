class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :deck
      t.string :question
      t.string :answer


      t.timestamps
    end
  end
end

class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.references :card
      t.references :round
      t.boolean :is_correct

      t.timestamps
    end
  end
end

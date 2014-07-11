class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.belongs_to :sender, index: true,  null: false
      t.belongs_to :receiver, index: true,  null: false
      t.text :body,  null: false
      t.timestamps null: false
    end
    
  end
end

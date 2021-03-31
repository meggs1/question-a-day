class CreateQuestiontags < ActiveRecord::Migration[6.1]
  def change
    create_table :questiontags do |t|
      t.integer :question_id
      t.integer :tag_id

      t.timestamps
    end
  end
end

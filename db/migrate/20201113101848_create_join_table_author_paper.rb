class CreateJoinTableAuthorPaper < ActiveRecord::Migration[6.0]
  def change
    create_join_table :authors, :papers
  end
end

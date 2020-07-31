class AddPostToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :post, foreign_key: true
  end
end

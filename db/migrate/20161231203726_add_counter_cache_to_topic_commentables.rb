class AddCounterCacheToTopicCommentables < ActiveRecord::Migration[5.0]
  def change
    add_column :majors, :comments_count, :integer, default: 0
    add_column :articles, :comments_count, :integer, default: 0
    add_column :topics, :comments_count, :integer, default: 0
    add_column :virtual_rooms, :comments_count, :integer, default: 0
  end
end

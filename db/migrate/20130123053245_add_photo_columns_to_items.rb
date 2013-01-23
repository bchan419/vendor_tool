class AddPhotoColumnsToItems < ActiveRecord::Migration
  def change
  	add_attachment :items, :photo
  end
end

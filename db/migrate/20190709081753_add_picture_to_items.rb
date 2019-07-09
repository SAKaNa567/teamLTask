class AddPictureToItems < ActiveRecord::Migration[5.2]
  def self.up
    add_attachment :items, :picture
  end

  def self.down
    remove_attachment :items, :picture
  end
end

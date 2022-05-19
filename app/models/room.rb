class Room < ApplicationRecord
  validates :name, presence:true
  validates :introduction, presence:true
  validates :fee, presence:true
  validates :address, presence:true
  validates :image, presence:true

  mount_uploader :image, ImageUploader

  

end

class Wiki < ActiveRecord::Base
  belongs_to :user
  def self.visible_to(user)
    user.wikis
  end

  mount_uploader :image, ImageUploader
end

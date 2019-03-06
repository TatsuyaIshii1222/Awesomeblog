class Post < ApplicationRecord
  belongs_to :user
  validates :content,{presence: true,
                     length:{maximum: 250}}

  default_scope{order(created_at: :desc)}

  mount_uploader :picture,PictureUploader

  validate :picture_size

  private 
    def picture_size
      errors.add(:picture,"should be less than 5mb") if picture.size > 5.megabytes
    end
end

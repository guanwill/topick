class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { thumb: ["250x250#"]}

  # has_attached_file :image,
                  # url: "/system/:hash.:extension"
                  # hash_secret: "abc123"

  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  belongs_to :user
end

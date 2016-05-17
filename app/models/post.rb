class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5}
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  before_save :parse_yt_link

mount_uploader :image, ImageUploader

def parse_yt_link
  if self.ytlink?
  self.ytlink = YouTubeAddy.extract_video_id(ytlink)
else
  self.ytlink = nil
end
end

end

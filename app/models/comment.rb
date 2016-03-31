class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :recording

  validates :user, :recording, :body, presence: true
end

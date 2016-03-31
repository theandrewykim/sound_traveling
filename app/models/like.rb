class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :recording

  validates :user, :recording, presence: true
end

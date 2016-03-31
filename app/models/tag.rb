class Tag < ActiveRecord::Base

  has_many :recording_tags
  has_many :recordings, through: :recording_tags

  validates :name, presence: true
end

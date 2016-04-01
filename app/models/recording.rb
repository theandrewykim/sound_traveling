class Recording < ActiveRecord::Base

  belongs_to :user

  has_many :likes
  has_many :flags
  has_many :comments
  has_many :recording_tags
  has_many :tags, through: :recording_tags

  has_many :flag_users, through: :flags, source: :user
  has_many :like_users, through: :likes, source: :user

  validates :title, :latitude, :longitude, :sound_file, presence: true



end

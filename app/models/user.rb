class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recordings
  has_many :likes
  has_many :flags
  has_many :comments
  has_many :liked_recordings, through: :likes, source: :recording
  has_many :flagged_recordings, through: :flags, source: :recording

  validates :username, uniqueness: true

  acts_as_voter

end

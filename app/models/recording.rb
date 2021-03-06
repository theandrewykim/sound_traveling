class Recording < ActiveRecord::Base

  include ApplicationHelper

  scope :by_title, ->(regex){
    where("title ~* ?", "#{Regexp.escape(regex)}")
  }

  scope :by_city, ->(regex){
    where("city ~* ?", "#{Regexp.escape(regex)}")
  }

  scope :by_tag, ->(regex){
    joins(:taggings, :tags).where("tags.name ~* ?", "#{Regexp.escape(regex)}").uniq
  }

  belongs_to :user

  has_many :likes
  has_many :flags
  has_many :comments
  has_many :recording_tags
  has_many :tags, through: :recording_tags
  has_many :playlistrecordings
  has_many :playlists, through: :playlistrecordings

  has_many :flag_users, through: :flags, source: :user
  has_many :like_users, through: :likes, source: :user

  validates :title, :user, :sound, presence: true
  validates :latitude, presence: { message: "Please pick a spot on the map" }

  has_attached_file :sound, storage: :s3, bucket: 'demotracks'

  validates_attachment_content_type :sound, content_type: ['audio/mpeg','audio/mp3']

  acts_as_taggable
  acts_as_votable
  acts_as_commentable

  enum channels: {unspecified: 0, mono: 1, stereo: 2, binaural: 3}

  # autocomplete :tag, :name, class_name: 'ActsAsTaggableOn::Tag'

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city    = geo.city
      obj.zipcode = geo.postal_code
      obj.country = geo.country_code
    end
  end

  after_validation :reverse_geocode

  def player_params
    {recordingname: self.title,
     url: self.sound.url,
     latitude: self.latitude,
     longitude: self.longitude}
  end


end

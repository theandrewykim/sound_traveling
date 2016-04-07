class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :playlistrecordings
  has_many :recordings, through: :playlistrecordings

  def has_recording?(recording)

    !!self.recordings.include?(recording)
  end

end

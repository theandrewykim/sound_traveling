class Playlistrecording < ActiveRecord::Base
  belongs_to :recording
  belongs_to :playlist

  def self.exists?(recording, playlist)
    Playlistrecording.where(recording: recording, playlist: playlist) ? true : false
  end
end

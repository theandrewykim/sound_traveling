class Playlistrecording < ActiveRecord::Base
  belongs_to :recording
  belongs_to :playlist
end

class RecordingTag < ActiveRecord::Base

  belongs_to :tag
  belongs_to :recording

  validates :tag, :recording, presence: true
end

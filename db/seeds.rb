users_amount      = 0
recordings_amount = 10
tags_per_recording = (0..4).to_a
likes_per_recording = (5..40).to_a
flags_per_recording = (0..5).to_a
comments_per_recording = (3..9).to_a


sound_file_url    = 'http://www.palmbeach.k12.fl.us/RooseveltMS/cavank/sounds/loops/Funky_loop.wav'
test_tags         = ['forest', 'europe', 'binaural', 'stereo', 'mono', 'city', 'ocean']
password = 'password'



User.create!(username: 'joe', email: 'josephcase@gmail.com', password: password )
User.create!(username: 'will', email: 'william@wvwproductions.com', password: password)
User.create!(username: 'andrew', email: 'theandrewkimm@gmail.com', password: password)

users_amount.times do
  User.create(username: Faker::Internet.user_name,
              email: Faker::Internet.email,
              password: password)
end

users = User.all

recordings_amount.times do

  tag_list = 'audio'
  tag_shuffle = test_tags.shuffle
  tags_per_recording.sample.times do
     tag_list += ', ' + tag_shuffle.shift
  end


  recording = Recording.create!(title: Faker::Book.title,
                                latitude: Faker::Address.latitude,
                                longitude: Faker::Address.longitude,
                                description: Faker::Hipster.paragraph(10),
                                tag_list: tag_list
                                )



  likes_per_recording.sample.times do
    Like.create!(user: users.sample,
                recording: recording
                )
  end

  flags_per_recording.sample.times do
    Flag.create!(user: users.sample,
                recording: recording
                )
  end

  comments_per_recording.sample.times do
    Comment.create!(user: users.sample,
                    recording: recording,
                    body: Faker::Hipster.paragraph(6)
                    )
  end

end




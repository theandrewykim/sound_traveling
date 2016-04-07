create_admins = true

users_amount      = 3
recordings_amount = 30

additional_tag_amount  = 15

tags_per_recording = (2..6).to_a
likes_per_recording = (5..40).to_a
flags_per_recording = (0..5).to_a
comments_per_recording = (3..9).to_a
additional_tag_amount  = 10


sound_file_url    = 'http://www.palmbeach.k12.fl.us/RooseveltMS/cavank/sounds/loops/Funky_loop.wav'
test_tags         = ['forest', 'europe', 'binaural', 'stereo', 'mono', 'city', 'ocean']
password = 'password'

additional_tag_amount.times do
  test_tags << Faker::Address.city_prefix
end


if create_admins
  User.create!(username: 'joe', email: 'josephcase@gmail.com', password: password, description: Faker::Lorem.paragraph(9))
  User.create!(username: 'will', email: 'william@wvwproductions.com', password: password, description: Faker::Lorem.paragraph(9))
  User.create!(username: 'andrew', email: 'theandrewkimm@gmail.com', password: password, description: Faker::Lorem.paragraph(9))
end

users_amount.times do
  User.create!(username: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password: password,
               description: Faker::Lorem.paragraph(9))
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
                                tag_list: tag_list,
                                user: users.sample,
                                channels: rand(4),
                                sound: File.new("./app/assets/audio/crowd-yay.mp3")
                                )



  likes_per_recording.sample.times do
    recording.liked_by (users.sample)
  end

  comments_per_recording.sample.times do

  recording.comments.create!(user: users.sample,
                            body: Faker::Hipster.paragraph(6)
                            )
  end

end




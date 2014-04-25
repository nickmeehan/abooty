10.times do
	User.create name: Faker::Name.name,
							handle: Faker::Internet.user_name,
							email: Faker::Internet.email,
							password_hash: Faker::Internet.domain_word
end

User.all.each do |user|
	10.times do
		user.aboots.create(content: Faker::Lorem.sentence)
	end
end
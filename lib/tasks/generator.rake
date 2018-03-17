namespace :generator do
  task users: :environment do
    1000.times do
      User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email
      )
    end
  end
end

namespace :generator do
  task users: :environment do
    1000.times do
      User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email
      )
    end
  end

  task tournaments: :environment do
    20.times do
      tournament = Tournament.create(
        name: Faker::Company.name,
        bracket_formated: [true, false].sample,
        started_at: [10.seconds.from_now, 10.minutes.from_now, 10.hours.from_now, 10.days.from_now].sample,
        limit: [8, 16, 32, 64, 128, 256].sample
      )
    end
  end
end

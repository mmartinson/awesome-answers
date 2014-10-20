task bootstrap_data: [:environment] do

  if Question.count>99
    puts "Data already bootstrapped"
  else
    100.times do
      Question.create(title: Faker::Company.bs, description: Faker::Hacker.say_something_smart)
    end
  end
end